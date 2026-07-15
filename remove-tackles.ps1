$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    $modified = $false
    
    if ($content -match ' & Tackles') {
        $content = $content -replace ' & Tackles', ''
        $modified = $true
    }
    if ($content -match ' &amp; Tackles') {
        $content = $content -replace ' &amp; Tackles', ''
        $modified = $true
    }
    if ($content -match '<br />& Tackles') {
        $content = $content -replace '<br />& Tackles', ''
        $modified = $true
    }
    if ($content -match ' and tackles') {
        $content = $content -replace ' and tackles', ''
        $modified = $true
    }
    if ($content -match '<br/>& Tackles') {
        $content = $content -replace '<br/>& Tackles', ''
        $modified = $true
    }

    if ($modified) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
