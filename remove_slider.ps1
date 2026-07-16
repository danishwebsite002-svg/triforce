$file = "c:\Users\MSI 1\Downloads\newtradedubai\lifting-equipments.html"
$lines = Get-Content -Path $file

# Lines to keep: 1 to 190 (index 0 to 189)
# Lines to keep: 250 to end (index 249 to end)
$newContent = $lines[0..189] + $lines[249..($lines.Length - 1)]

Set-Content -Path $file -Value ($newContent -join "`r`n") -Encoding UTF8
Write-Host "Removed logo slider from lifting-equipments.html"
