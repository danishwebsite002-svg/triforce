$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

$pattern = '(?s)<div class="header-action">\s*<a href="tel:\+9710000000" class="btn btn-primary">Call Us</a>\s*</div>'
$replacement = '<div class="header-action">
          <a href="contact.html" class="btn btn-outline">Contact Us</a>
        </div>'

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match $pattern) {
        $newContent = [regex]::Replace($content, $pattern, $replacement, 1)
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
