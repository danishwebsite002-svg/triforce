$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter *.html

$oldBlock = @"
          <ul class="footer-links">
            <li>
              <a href="about.html"
                ><i class="fa-solid fa-angle-right"></i> About Us</a
              >
            </li>
            <li>
              <a href="products.html"
                ><i class="fa-solid fa-angle-right"></i> Categories</a
              >
            </li>
            <li>
              <a href="projects.html"
                ><i class="fa-solid fa-angle-right"></i> Projects</a
              >
            </li>
            <li>
              <a href="partners.html"
                ><i class="fa-solid fa-angle-right"></i> Brands</a
              >
            </li>
            <li>
              <a href="contact.html"
                ><i class="fa-solid fa-angle-right"></i> Contact Us</a
              >
            </li>
          </ul>
"@

$newBlock = @"
          <ul class="footer-links">
            <li>
              <a href="index.html"
                ><i class="fa-solid fa-angle-right"></i> Home</a
              >
            </li>
            <li>
              <a href="about.html"
                ><i class="fa-solid fa-angle-right"></i> About Us</a
              >
            </li>
            <li>
              <a href="contact.html"
                ><i class="fa-solid fa-angle-right"></i> Contact Us</a
              >
            </li>
            <li>
              <a href="terms.html"
                ><i class="fa-solid fa-angle-right"></i> Terms and Condition</a
              >
            </li>
            <li>
              <a href="privacy.html"
                ><i class="fa-solid fa-angle-right"></i> Privacy Policy</a
              >
            </li>
            <li>
              <a href="cookie.html"
                ><i class="fa-solid fa-angle-right"></i> Cookie Policy</a
              >
            </li>
          </ul>
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
