$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

$replacement = @"
            <li><a href="building-material.html">Building Material</a></li>
            <li><a href="technical-supplies.html">Technical Supplies</a></li>
            <li><a href="lubricants.html">Lubricants</a></li>
            <li><a href="instrument.html">Instrument</a></li>
            <li><a href="lifting-equipments.html">Lifting Equipments &amp; Tackles</a></li>
"@

$pattern = '(?s)<li class="dropdown">\s*<a href="products\.html"\s*>CATEGORIES[\s\S]*?</ul>\s*</li>'

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -match $pattern) {
        $newContent = [regex]::Replace($content, $pattern, $replacement)
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
