$files = Get-ChildItem -Path . -Filter *.html

$metaTags = @"
    <meta name="description" content="TRIFORCE ENTERPRISES L.L.C is a reliable building materials supplier based in Dubai, UAE, providing hardware, electrical items, power tools, and more." />
    <meta property="og:title" content="TRIFORCE - UAE's Reliable Building Materials Supplier" />
    <meta property="og:description" content="TRIFORCE ENTERPRISES L.L.C is a reliable building materials supplier based in Dubai, UAE." />
    <meta property="og:image" content="https://triforce.ae/logotransparent.png" />
    <meta property="og:type" content="website" />
    <link rel="icon" href="logotransparent.png" type="image/png" />
"@

foreach ($file in $files) {
    # Skip if already has meta description (to avoid duplicate injection if run twice)
    $content = Get-Content $file.FullName -Raw
    if ($content -match '<meta name="description"') {
        continue
    }

    # Replace </head> with the meta tags + </head>
    $content = $content -replace '</head>', "$metaTags`n  </head>"

    [IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Injected SEO tags into $($file.Name)"
}
