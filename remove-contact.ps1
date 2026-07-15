$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

$pattern = '(?s)\s*<li><a href="contact\.html">Contact Us</a></li>'
$replacement = ''

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match $pattern) {
        # Only replace the first match to ensure we don't accidentally remove anything else, though the pattern is specific
        $newContent = [regex]::Replace($content, $pattern, $replacement, 1)
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
