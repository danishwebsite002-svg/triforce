$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    $changed = $false
    if ($content -match 'src="logotransparent\.png"') {
        $content = $content -replace 'src="logotransparent\.png"', 'src="logowhite.png"'
        $changed = $true
    }
    if ($content -match 'src="logofooter\.png"') {
        $content = $content -replace 'src="logofooter\.png"', 'src="logowhite.png"'
        $changed = $true
    }
    
    if ($changed) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
