import glob
import os

for filepath in glob.glob("*.html"):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Replace logo style
    content = content.replace('style="max-height: 60px; width: auto"', 'style="max-height: 80px; width: auto"')
    
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
        
print("Updated logo sizes in all HTML files.")
