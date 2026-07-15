$indexFile = "c:\Users\MSI 1\Downloads\newtradedubai\index.html"
$styleFile = "c:\Users\MSI 1\Downloads\newtradedubai\style.css"

$content = Get-Content -Path $indexFile -Raw -Encoding UTF8
$content = $content -replace "rgba\(220,\s*38,\s*38,", "rgba(21, 75, 147,"
Set-Content -Path $indexFile -Value $content -Encoding UTF8

$content = Get-Content -Path $styleFile -Raw -Encoding UTF8
$content = $content -replace "rgba\(220,\s*38,\s*38,", "rgba(21, 75, 147,"
Set-Content -Path $styleFile -Value $content -Encoding UTF8

Write-Host "Updated red shadows to blue"
