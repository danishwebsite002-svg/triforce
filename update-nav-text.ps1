$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    $modified = $false
    
    if ($content -match '>Building Material<') {
        $content = $content -replace '>Building Material<', '>Building Materials<'
        $modified = $true
    }
    
    if ($content -match '>Instrument<') {
        $content = $content -replace '>Instrument<', '>Instruments<'
        $modified = $true
    }
    
    if ($content -match '>Lifting Equipments &amp; Tackles<') {
        $content = $content -replace '>Lifting Equipments &amp; Tackles<', '>Lifting Equipments<'
        $modified = $true
    }

    if ($modified) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
