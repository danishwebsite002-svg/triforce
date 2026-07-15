$css = @"

/* Glowing Header Button */
@keyframes glowingButton {
    0% {
        box-shadow: 0 0 5px var(--primary);
    }
    50% {
        box-shadow: 0 0 20px var(--primary), 0 0 30px var(--primary);
    }
    100% {
        box-shadow: 0 0 5px var(--primary);
    }
}

.header-action .btn-primary {
    animation: glowingButton 2s infinite;
    transition: all 0.3s ease;
}

.header-action .btn-primary:hover {
    animation: none;
    box-shadow: 0 0 25px var(--primary), 0 0 40px var(--primary);
    transform: scale(1.05);
}
"@

Add-Content -Path "c:\Users\MSI 1\Downloads\newtradedubai\style.css" -Value $css
