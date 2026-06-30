import os
import re

files = [f for f in os.listdir('.') if f.endswith('.html') and f != 'index.html']

with open('index.html', 'r', encoding='utf-8') as f:
    index_content = f.read()

header_match = re.search(r'<!-- Navbar -->\s*<header class="header">.*?</header>', index_content, re.DOTALL)
footer_match = re.search(r'<!-- Footer -->\s*<footer class="footer">.*?</footer>', index_content, re.DOTALL)

if not header_match or not footer_match:
    print("Could not find header or footer in index.html")
    exit(1)

header_content = header_match.group(0)
footer_content = footer_match.group(0)

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace header
    content = re.sub(r'<!-- Navbar -->\s*<header class="header">.*?</header>', header_content, content, flags=re.DOTALL)
    
    # Replace footer
    content = re.sub(r'<!-- Footer -->\s*<footer class="footer">.*?</footer>', footer_content, content, flags=re.DOTALL)
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(content)
        
    print(f"Updated {file}")
