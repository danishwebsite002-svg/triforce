import os
import glob
import re

html_files = glob.glob('*.html')

dropdown_html = '''<li class="dropdown">
              <a href="products.html">PRODUCTS <i class="fa-solid fa-plus" style="font-size:0.8em; margin-left:4px; color:var(--primary);"></i></a>
              <ul class="dropdown-menu">
                <li><a href="building-material.html">Building Material</a></li>
                <li><a href="technical-supplies.html">Technical Supplies</a></li>
                <li><a href="lubricants.html">Lubricants</a></li>
                <li><a href="instrument.html">Instrument</a></li>
                <li><a href="lifting-equipments.html">Lifting Equipments &amp; Tackles</a></li>
              </ul>
            </li>
'''

old_products_re = re.compile(r'<li><a href="products\.html">Our Products</a></li>')
old_projects_re = re.compile(r'<li><a href="projects\.html">Projects</a></li>')

for file in html_files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace Our Products with DIVISIONS dropdown
    content = old_products_re.sub(dropdown_html, content)
    
    # We might want to remove Projects if CERTIFICATES replaces it, or just leave it. Let's just remove Projects for now if they wanted CERTIFICATES there, but the user only mentioned "update that" referring to products.
    # Wait, the dropdown is the main thing. I'll just change Our Products.

    with open(file, 'w', encoding='utf-8') as f:
        f.write(content)

print("Updated HTML files.")
