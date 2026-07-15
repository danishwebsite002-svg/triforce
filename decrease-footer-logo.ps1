$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match 'max-height:\s*160px;') {
        $content = $content -replace 'max-height:\s*160px;', 'max-height: 110px;'
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
