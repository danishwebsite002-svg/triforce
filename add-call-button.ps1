$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

$pattern = '</nav>'
$replacement = '</nav>
        <div class="header-action">
          <a href="tel:+9710000000" class="btn btn-primary">Call Us</a>
        </div>'

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -notmatch '<div class="header-action">') {
        $content = [regex]::Replace($content, $pattern, $replacement, 1)
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
