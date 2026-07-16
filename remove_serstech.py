import re

with open('instrument.html', 'r', encoding='utf-8') as f:
    content = f.read()

pattern = r'\s*<a href=\"#\" class=\"bm-card\">\s*<img src=\"https://images\.unsplash\.com/photo-1504868584819-f8e8b4b6d7e3\?auto=format&fit=crop&w=600&q=80\" alt=\"Serstech Arx MkII Handheld\">\s*<h3 class=\"bm-title\">Serstech Arx MkII Handheld</h3>\s*</a>'

new_content = re.sub(pattern, '', content)

with open('instrument.html', 'w', encoding='utf-8') as f:
    f.write(new_content)

print('Replaced successfully')
