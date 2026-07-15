$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match "(?i)<footer") {
        $parts = $content -split "(?i)<footer", 2
        $footerPart = $parts[1] -replace 'max-height:\s*80px;', 'max-height: 160px;'
        $content = $parts[0] + "<footer" + $footerPart
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
