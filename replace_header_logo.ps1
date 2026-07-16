$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter *.html

$oldBlock = @"
          <img
            src="logowhite.png"
            alt="TRIFORCE Logo"
            style="max-height: 75px; width: auto"
          />
"@

$newBlock = @"
          <img
            src="logowhite.png"
            alt="TRIFORCE Logo"
            style="max-height: 110px; width: auto"
          />
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
