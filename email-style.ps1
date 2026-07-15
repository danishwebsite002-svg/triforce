$css = @"

/* Header Email Style */
.header-email {
    color: var(--white);
    font-weight: 500;
    font-size: 16px;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: all 0.3s ease;
}
.header-email i {
    font-size: 18px;
    color: var(--primary);
}
.header-email:hover {
    color: var(--primary);
}
"@

Add-Content -Path "c:\Users\MSI 1\Downloads\newtradedubai\style.css" -Value $css
