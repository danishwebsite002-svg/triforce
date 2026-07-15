$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match 'style="display: flex; gap: 30px; justify-content: center"') {
        $content = $content -replace 'style="display: flex; gap: 30px; justify-content: center"', 'style="display: flex; gap: 30px; justify-content: center; flex-wrap: wrap;"'
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
