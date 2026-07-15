$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match 'class="footer-logo mb-20"') {
        $content = $content -replace 'class="footer-logo mb-20"', 'class="footer-logo"'
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
