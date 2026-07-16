import os
import glob
import re

dir_path = r"c:\Users\MSI 1\Downloads\newtradedubai"
html_files = glob.glob(os.path.join(dir_path, "*.html"))

old_block = """          <ul class="footer-links">
            <li>
              <a href="about.html"
                ><i class="fa-solid fa-angle-right"></i> About Us</a
              >
            </li>
            <li>
              <a href="products.html"
                ><i class="fa-solid fa-angle-right"></i> Categories</a
              >
            </li>
            <li>
              <a href="projects.html"
                ><i class="fa-solid fa-angle-right"></i> Projects</a
              >
            </li>
            <li>
              <a href="partners.html"
                ><i class="fa-solid fa-angle-right"></i> Brands</a
              >
            </li>
            <li>
              <a href="contact.html"
                ><i class="fa-solid fa-angle-right"></i> Contact Us</a
              >
            </li>
          </ul>"""

new_block = """          <ul class="footer-links">
            <li>
              <a href="index.html"
                ><i class="fa-solid fa-angle-right"></i> Home</a
              >
            </li>
            <li>
              <a href="about.html"
                ><i class="fa-solid fa-angle-right"></i> About Us</a
              >
            </li>
            <li>
              <a href="contact.html"
                ><i class="fa-solid fa-angle-right"></i> Contact Us</a
              >
            </li>
            <li>
              <a href="terms.html"
                ><i class="fa-solid fa-angle-right"></i> Terms and Condition</a
              >
            </li>
            <li>
              <a href="privacy.html"
                ><i class="fa-solid fa-angle-right"></i> Privacy Policy</a
              >
            </li>
            <li>
              <a href="cookie.html"
                ><i class="fa-solid fa-angle-right"></i> Cookie Policy</a
              >
            </li>
          </ul>"""

for file_path in html_files:
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    # Try direct string replacement first
    if old_block in content:
        content = content.replace(old_block, new_block)
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"Updated {os.path.basename(file_path)}")
    else:
        # Fallback to regex if exact match fails due to line endings
        # Normalize line endings
        normalized_content = content.replace('\r\n', '\n')
        normalized_old = old_block.replace('\r\n', '\n')
        if normalized_old in normalized_content:
            content = normalized_content.replace(normalized_old, new_block.replace('\r\n', '\n'))
            with open(file_path, "w", encoding="utf-8") as f:
                f.write(content)
            print(f"Updated {os.path.basename(file_path)} using normalized line endings")
        else:
            print(f"Warning: Block not found in {os.path.basename(file_path)}")

