$file = "c:\Users\MSI 1\Downloads\newtradedubai\style.css"
$content = Get-Content -Path $file -Raw

# Replace variables
$content = $content -replace '--primary: #dc2626;', '--primary: #ffcc00;'
$content = $content -replace '--primary-hover: #b91c1c;', '--primary-hover: #e6b800;'

# Regex to replace color: var(--white); with color: var(--secondary); in specific blocks
$content = $content -replace '(?s)(\.btn-primary\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--white\);)', '$1color: var(--secondary);'
$content = $content -replace '(?s)(\.btn-primary:hover\s*\{.*?background-color:\s*var\(--primary-hover\);.*?)(color:\s*var\(--white\);)', '$1color: var(--secondary);'
$content = $content -replace '(?s)(\.section-tag\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--white\);)', '$1color: var(--secondary);'
$content = $content -replace '(?s)(\.play-button\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--white\);)', '$1color: var(--secondary);'
$content = $content -replace '(?s)(\.timeline-date\s*\{.*?background-color:\s*var\(--primary\);.*?)(color:\s*var\(--white\);)', '$1color: var(--secondary);'

# Replace about-mission-card background to secondary
$content = $content -replace '(?s)(\.about-mission-card\s*\{.*?)(background-color:\s*var\(--primary\);)', '$1background-color: var(--secondary);'

Set-Content -Path $file -Value $content -Encoding UTF8
Write-Host "Updated style.css"
