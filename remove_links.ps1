$htmlFiles = Get-ChildItem -Path . -Filter *.html

# 1. Regex patterns for Header Links
$headerProjectsRegex = '<li>\s*<a href="projects\.html">Projects</a>\s*</li>'
$headerPartnersRegex = '<li>\s*<a href="partners\.html">Partners</a>\s*</li>'

# 2. Regex patterns for Footer Links
$footerProjectsRegex = '(?s)<li>\s*<a href="projects\.html"[^>]*>\s*<i class="fa-solid fa-angle-right"></i>\s*Projects\s*</a>\s*</li>'
$footerPartnersRegex = '(?s)<li>\s*<a href="partners\.html"[^>]*>\s*<i class="fa-solid fa-angle-right"></i>\s*(Brands|Partners)\s*</a>\s*</li>'

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $original = $content
    
    # Remove header links
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $headerProjectsRegex, "")
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $headerPartnersRegex, "")
    
    # Remove footer links
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $footerProjectsRegex, "")
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $footerPartnersRegex, "")
    
    if ($content -ne $original) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Removed links from $($file.Name)"
    } else {
        Write-Host "No changes in $($file.Name)"
    }
}
