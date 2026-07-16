$replacements = @(
    @{
        File = "building-material.html"
        OldText = 'Complete range of essential building materials for any construction scale.'
        NewText = 'We are trusted supplier of premium building materials, industrial tools, and construction solutions, serving contractors, developers, and industrial clients across the UAE. Backed by over 15 years of industry expertise, we deliver a comprehensive portfolio of high-quality products from globally recognized brands, ensuring reliability, durability, and value for every project. With a strong commitment to quality, timely delivery, and exceptional customer service, we provide complete supply solutions that support projects of every scale, from infrastructure and commercial developments to residential construction.'
    },
    @{
        File = "technical-supplies.html"
        OldText = 'Top-tier technical supplies for precision and durability in every project.'
        NewText = 'We are a trusted provider of industrial, electrical, mechanical, and technical products, delivering reliable solutions to industries, contractors, OEMs, and maintenance professionals across the UAE. Our comprehensive portfolio features high-quality products from globally recognized manufacturers, enabling us to meet the evolving demands of manufacturing, oil & gas, construction, utilities, and industrial maintenance. Backed by technical expertise, dependable sourcing, and responsive customer service, we help businesses enhance operational efficiency with quality products and timely supply solutions.'
    },
    @{
        File = "lubricants.html"
        OldText = 'High-quality industrial and commercial lubricants.'
        NewText = 'We specialize in supplying premium aviation and industrial lubricants designed to maximize equipment performance, reliability, and operational efficiency. We offer a carefully selected range of high-quality oils, greases, hydraulic fluids, and specialty lubricants from globally recognized manufacturers, serving the aviation, manufacturing, construction, marine, energy, and industrial sectors. With a commitment to quality, technical expertise, and dependable supply, we deliver lubrication solutions that help businesses reduce downtime and extend the life of critical equipment.'
    },
    @{
        File = "instrument.html"
        OldText = 'Reliable and precise instrumentation for various applications.'
        NewText = 'We are a trusted provider of advanced laboratory, analytical, and scientific instrumentation solutions, serving research institutions, industrial laboratories, healthcare facilities, educational organizations, and quality control environments across the UAE. Our comprehensive portfolio includes analytical instruments, laboratory chemicals, testing equipment, medical devices, environmental monitoring solutions, and specialized scientific instruments sourced from globally recognized manufacturers. With a commitment to precision, innovation, and technical excellence, we deliver reliable solutions that empower accurate analysis, regulatory compliance, and scientific advancement.'
    },
    @{
        File = "lifting-equipments.html"
        OldText = 'Safe and robust lifting equipment for heavy-duty needs.'
        NewText = 'We are a trusted provider of lifting, rigging, and material handling solutions, delivering certified products that support safe and efficient lifting operations across diverse industries. Our extensive portfolio includes chain hoists, wire ropes, lifting slings, shackles, hooks, lifting clamps, material handling equipment, fall protection systems, and rigging accessories from globally recognized manufacturers. Driven by a commitment to safety, quality, and technical excellence, we help our customers execute critical lifting operations with confidence, reliability, and compliance to the highest international standards.'
    }
)

foreach ($item in $replacements) {
    if (Test-Path $item.File) {
        $content = Get-Content $item.File -Raw
        $content = $content.Replace($item.OldText, $item.NewText)
        Set-Content -Path $item.File -Value $content -Encoding UTF8
        Write-Host "Updated $($item.File)"
    } else {
        Write-Host "File not found: $($item.File)"
    }
}
