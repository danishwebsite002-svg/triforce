import re

file_path = r"c:\Users\MSI 1\Downloads\newtradedubai\style.css"

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Change variables
content = content.replace('--primary: #dc2626;', '--primary: #ffcc00;')
content = content.replace('--primary-hover: #b91c1c;', '--primary-hover: #e6b800;')

# Now find specific classes and change text color to secondary for better contrast
def replace_color_in_class(css_content, class_name):
    # Regex to find the class block and replace color: var(--white); with color: var(--secondary);
    # This is a bit tricky with regex, let's just do targeted string replacements based on what we saw
    return css_content

# Targeted string replacements
content = content.replace(""".btn-primary {
    background-color: var(--primary);
    color: var(--white);
}""", """.btn-primary {
    background-color: var(--primary);
    color: var(--secondary);
}""")

content = content.replace(""".btn-primary:hover {
    background-color: var(--primary-hover);
    color: var(--white);
}""", """.btn-primary:hover {
    background-color: var(--primary-hover);
    color: var(--secondary);
}""")

content = content.replace(""".section-tag {
    background-color: var(--primary);
    color: var(--white);""", """.section-tag {
    background-color: var(--primary);
    color: var(--secondary);""")

content = content.replace(""".play-button {
    width: 70px;
    height: 70px;
    background-color: var(--primary);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--white);""", """.play-button {
    width: 70px;
    height: 70px;
    background-color: var(--primary);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--secondary);""")

content = content.replace(""".timeline-date {
    background-color: var(--primary);
    color: var(--white);""", """.timeline-date {
    background-color: var(--primary);
    color: var(--secondary);""")

content = content.replace(""".about-mission-card {
    background-color: var(--primary);
    color: var(--white);""", """.about-mission-card {
    background-color: var(--secondary);
    color: var(--white);""") 
# Made about mission card secondary background so it's not a giant yellow box.

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Updated style.css")
