$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter *.html

$oldBlock = @"
          <div class="fb-links">
            <a href="terms.html">Terms & Conditions</a>
            <span class="divider">|</span>
            <a href="privacy.html">Privacy Policy</a>
            <span class="divider">|</span>
            <a href="cookie.html">Cookie Policy</a>
          </div>
"@

$newBlock = @"
          <div class="fb-links">
            Design and developed by <a href="https://goadslive.com" target="_blank">Go Ads Live</a>
          </div>
"@

# Normalize line endings to avoid issues
$oldBlockNormalized = $oldBlock -replace "`r`n", "`n"
$newBlockNormalized = $newBlock -replace "`r`n", "`n"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $contentNormalized = $content -replace "`r`n", "`n"
    
    if ($contentNormalized.Contains($oldBlockNormalized)) {
        $contentNormalized = $contentNormalized.Replace($oldBlockNormalized, $newBlockNormalized)
        Set-Content -Path $file.FullName -Value $contentNormalized -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    } else {
        Write-Host "Warning: Block not found in $($file.Name)"
    }
}
