$cssPath = "c:\Users\MSI 1\Downloads\newtradedubai\style.css"

$cssContent = @"

/* Floating Contact Buttons */
.floating-contact {
    position: fixed;
    bottom: 30px;
    right: 30px;
    display: flex;
    flex-direction: column;
    gap: 15px;
    z-index: 999;
}

.float-btn {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 30px;
    color: #fff;
    text-decoration: none;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.float-btn:hover {
    transform: translateY(-5px) scale(1.05);
    color: #fff;
}

.call-btn {
    background-color: #154b93;
}
.call-btn:hover {
    box-shadow: 0 6px 15px rgba(21, 75, 147, 0.4);
}

.wa-btn {
    background-color: #25D366;
}
.wa-btn:hover {
    box-shadow: 0 6px 15px rgba(37, 211, 102, 0.4);
}

@media (max-width: 768px) {
    .floating-contact {
        bottom: 20px;
        right: 20px;
        gap: 10px;
    }
    .float-btn {
        width: 50px;
        height: 50px;
        font-size: 24px;
    }
}
"@

Add-Content -Path $cssPath -Value $cssContent -Encoding UTF8
Write-Host "Appended floating button CSS to style.css"

$dirPath = "c:\Users\MSI 1\Downloads\newtradedubai"
$htmlFiles = Get-ChildItem -Path $dirPath -Filter "*.html"

$htmlSnippet = @"
    <!-- Floating Contact -->
    <div class="floating-contact">
      <a href="tel:+97142393572" class="float-btn call-btn" title="Call Us">
        <i class="fa-solid fa-phone"></i>
      </a>
      <a href="https://wa.me/97142393572" class="float-btn wa-btn" target="_blank" title="WhatsApp Us">
        <i class="fa-brands fa-whatsapp"></i>
      </a>
    </div>
</body>
"@

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if ($content -notmatch 'class="floating-contact"') {
        $content = $content -replace '</body>', $htmlSnippet
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
