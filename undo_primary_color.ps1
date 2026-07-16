$file = "c:\Users\MSI 1\Downloads\newtradedubai\style.css"
$content = Get-Content -Path $file -Raw

# Revert variables
$content = $content -replace '--primary: #ffcc00;', '--primary: #dc2626;'
$content = $content -replace '--primary-hover: #e6b800;', '--primary-hover: #b91c1c;'

# Regex to revert color: var(--secondary); back to color: var(--white); in specific blocks
$content = $content -replace '(?s)(\.btn-primary\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--secondary\);)', '$1color: var(--white);'
$content = $content -replace '(?s)(\.btn-primary:hover\s*\{.*?background-color:\s*var\(--primary-hover\);.*?)(color:\s*var\(--secondary\);)', '$1color: var(--white);'
$content = $content -replace '(?s)(\.section-tag\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--secondary\);)', '$1color: var(--white);'
$content = $content -replace '(?s)(\.play-button\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--secondary\);)', '$1color: var(--white);'
$content = $content -replace '(?s)(\.timeline-date\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--secondary\);)', '$1color: var(--white);'

# Revert about-mission-card background back to primary
$content = $content -replace '(?s)(\.about-mission-card\s*\{.*?)(background-color:\s*var\(--secondary\);)', '$1background-color: var(--primary);'

Set-Content -Path $file -Value $content -Encoding UTF8
Write-Host "Reverted style.css"
