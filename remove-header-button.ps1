$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

$pattern = '(?s)\s*<div class="header-action">\s*<a href="contact\.html" class="btn btn-primary">Contact Us</a>\s*</div>'
$replacement = ''

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match $pattern) {
        $newContent = [regex]::Replace($content, $pattern, $replacement, 1)
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
