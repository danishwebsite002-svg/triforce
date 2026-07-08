import os
import re
import glob

def process_files():
    html_files = glob.glob('c:/Users/MSI 1/Downloads/newtradedubai/*.html')
    
    for file_path in html_files:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        original_content = content
        
        # 1. Links
        # Footer Our Products
        content = re.sub(r'href="#"(\s*>.*?Our Products)', r'href="products.html"\1', content, flags=re.IGNORECASE)
        # CTA Contact Us Today
        content = re.sub(r'href="index\.html"(\s+class="btn btn-primary"[^>]*>\s*Contact Us Today)', r'href="contact.html"\1', content, flags=re.IGNORECASE)

        # 2. Portfolio
        # Change 'Grand Mosque, Abu Dhabi' image if it is dubai_tunnels.png
        # The exact block:
        # <img src="dubai_tunnels.png" alt="Grand Mosque, Abu Dhabi" />
        # <div class="project-title-box">
        #   <h4>Grand Mosque, Abu Dhabi</h4>
        # </div>
        # And the other is:
        # <img src="sheikh-zayed-mosque.png" alt="Sheikh Zayed Mosque" />
        # <div class="project-title-box">
        #   <h4>Sheikh Zayed Mosque</h4>
        # </div>
        #
        # Let's fix the duplicates: 
        # Make the first one "Dubai Tunnels Project" with "dubai_tunnels.png"
        # Make the second one "Sheikh Zayed Mosque" with "sheikh-zayed-mosque.png"
        
        content = content.replace('alt="Grand Mosque, Abu Dhabi"', 'alt="Dubai Tunnels Project"')
        content = content.replace('<h4>Grand Mosque, Abu Dhabi</h4>', '<h4>Dubai Metro Tunnels</h4>')
        
        # 3. Stylesheet tags
        # Find exactly `<link rel=stylesheet>`
        empty_links = re.findall(r'<link\s+rel=stylesheet\s*>', content, flags=re.IGNORECASE)
        if empty_links:
            print(f"Found empty stylesheet links in {file_path}: {empty_links}")
            content = re.sub(r'<link\s+rel=stylesheet\s*>\n?', '', content, flags=re.IGNORECASE)
            
        # 4. Missing Icons
        # Find <i> tags without class
        empty_icons = re.findall(r'<i\s*>.*?</i>', content, flags=re.IGNORECASE)
        if empty_icons:
            print(f"Found empty icons in {file_path}: {empty_icons}")
        
        # 5. Empty location box
        # <div class="footer-map">\s*</div>
        empty_map = re.findall(r'<div class="footer-map">\s*</div>', content, flags=re.IGNORECASE)
        if empty_map:
            print(f"Found empty footer-map in {file_path}")
            iframe = '''<div class="footer-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3607.889373704391!2d55.314787599999995!3d25.2743066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e5f5d48af60ab1d%3A0x493855eba74fb50f!2sTRIFORCE%20ENTERPRISES%20LLC!5e0!3m2!1sen!2sin!4v1782023748562!5m2!1sen!2sin" width="100%" height="200" style="border: 0; border-radius: 8px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>'''
            content = re.sub(r'<div class="footer-map">\s*</div>', iframe, content, flags=re.IGNORECASE)
            
        # 6. Text Case
        old_text1 = "TRIFORCE ENTERPRISES L.L.C Was Established In The Year 2006 In\n                Dubai UAE. The Company Is Dealing In All Kinds Of Products Like\n                Building Materials, Fasteners, Electrical Items, Power Tools,\n                Hand Tools, Construction Materials And Equipments, Abrasives,\n                Packaging Items, Safety Items, HVAC And Related Products,\n                Cables, Consumable Items And Many More."
        new_text1 = "TRIFORCE ENTERPRISES L.L.C was established in the year 2006 in\n                Dubai UAE. The company is dealing in all kinds of products like\n                building materials, fasteners, electrical items, power tools,\n                hand tools, construction materials and equipments, abrasives,\n                packaging items, safety items, HVAC and related products,\n                cables, consumable items and many more."
        
        old_text2 = "TRIFORCE ENTERPRISES L.L.C Was Established In The Year 2006 In Dubai\n            UAE. The Company Is Dealing In All Kinds Of Products Like Building\n            Materials, Fasteners, Electrical Items, Power Tools, Hand Tools,\n            Construction Materials And Equipments And Many More."
        new_text2 = "TRIFORCE ENTERPRISES L.L.C was established in the year 2006 in Dubai\n            UAE. The company is dealing in all kinds of products like building\n            materials, fasteners, electrical items, power tools, hand tools,\n            construction materials and equipments and many more."
        
        # We will use regex to do a case-insensitive, whitespace-insensitive replacement
        def replace_title_case(match):
            text = match.group(0)
            # Find words that are title case and make them lower case except TRIFORCE ENTERPRISES L.L.C, UAE, HVAC
            # Actually, simpler to just replace the whole block since the text is known.
            return text
            
        # Let's just do a manual replace for the most common variants
        content = re.sub(r'Was Established In The Year', 'was established in the year', content)
        content = re.sub(r'In Dubai\s*UAE\.', 'in Dubai UAE.', content)
        content = re.sub(r'In Dubai\s*<br\s*/?>\s*UAE\.', 'in Dubai<br>UAE.', content)
        content = re.sub(r'The Company Is Dealing In All Kinds Of Products Like Building\s*Materials, Fasteners, Electrical Items, Power Tools, Hand Tools,\s*Construction Materials And Equipments', 'The company is dealing in all kinds of products like building materials, fasteners, electrical items, power tools, hand tools, construction materials and equipments', content, flags=re.IGNORECASE)
        content = re.sub(r'Abrasives,\s*Packaging Items, Safety Items, HVAC And Related Products,\s*Cables, Consumable Items And Many More', 'abrasives, packaging items, safety items, HVAC and related products, cables, consumable items and many more', content, flags=re.IGNORECASE)
        content = re.sub(r'And Many More\.', 'and many more.', content, flags=re.IGNORECASE)

        if content != original_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Updated {os.path.basename(file_path)}")

if __name__ == '__main__':
    process_files()
