$files = Get-ChildItem -Path . -Filter *.html

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    $original_content = $content

    $content = $content -replace 'href="terms.html"\s*>Privacy Policy</a>', 'href="privacy.html">Privacy Policy</a>'

    if ($content -ne $original_content) {
        [IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Updated $($file.Name)"
    }
}
