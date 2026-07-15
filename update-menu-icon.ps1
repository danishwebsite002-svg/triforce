$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $pattern = '(?s)display: none;\s*cursor: pointer;\s*font-size: 24px;\s*color: var\(--secondary\);'
    $replacement = 'display: none; cursor: pointer; font-size: 24px; color: var(--white);'
    
    if ($content -match $pattern) {
        $content = [regex]::Replace($content, $pattern, $replacement)
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
