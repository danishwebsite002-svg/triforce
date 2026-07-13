import os
import glob
import re

# Read products.html
with open('products.html', 'r', encoding='utf-8') as f:
    products_content = f.read()

# Split into header, body, footer
header_end = products_content.find('<div class="prod-container">')
footer_start = products_content.find('<!-- Accordion Script -->')

header = products_content[:header_end]
footer = products_content[footer_start:]

# We need the <div class="prod-container"> and its closing </div>
container_start = '<div class="prod-container">\n'
container_end = '    </div>\n    '

# Extract the first prod-row as a template
row_start = products_content.find('<div class="prod-row">')
row_end = products_content.find('<div class="prod-row">', row_start + 1)
prod_row_template = products_content[row_start:row_end]

pages = [
    {
        "file": "building-material.html",
        "title": "Building Material",
        "desc": "Complete range of essential building materials for any construction scale."
    },
    {
        "file": "technical-supplies.html",
        "title": "Technical Supplies",
        "desc": "Top-tier technical supplies for precision and durability in every project."
    },
    {
        "file": "lubricants.html",
        "title": "Lubricants",
        "desc": "High-quality industrial and commercial lubricants."
    },
    {
        "file": "instrument.html",
        "title": "Instrument",
        "desc": "Reliable and precise instrumentation for various applications."
    },
    {
        "file": "lifting-equipments.html",
        "title": "Lifting Equipments & Tackles",
        "desc": "Safe and robust lifting equipment and tackles for heavy-duty needs."
    }
]

for p in pages:
    row = prod_row_template
    # Replace the h2 title
    row = re.sub(r'<h2>.*?</h2>', f'<h2>{p["title"]}</h2>', row)
    # Replace the paragraph description
    row = re.sub(r'<p>Complete range of essential building materials for any construction scale.</p>', f'<p>{p["desc"]}</p>', row)
    
    # Change the banner title
    page_header = header.replace('Our Product Range', p["title"])
    page_header = page_header.replace('Discover our comprehensive range of premium building materials imported globally.', p["desc"])
    
    content = page_header + container_start + row + container_end + footer
    
    with open(p["file"], 'w', encoding='utf-8') as f:
        f.write(content)

print("Created 5 product pages.")

# Update links in all HTML files
html_files = glob.glob('*.html') + ['update_nav.py']
for f in html_files:
    with open(f, 'r', encoding='utf-8') as file:
        content = file.read()
    
    content = content.replace('products.html#building-material', 'building-material.html')
    content = content.replace('products.html#technical-supplies', 'technical-supplies.html')
    content = content.replace('products.html#lubricants', 'lubricants.html')
    content = content.replace('products.html#instrument', 'instrument.html')
    content = content.replace('products.html#lifting-equipments', 'lifting-equipments.html')
    
    with open(f, 'w', encoding='utf-8') as file:
        file.write(content)

print("Updated links in all files.")
