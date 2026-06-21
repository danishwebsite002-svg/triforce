const fs = require('fs');

const dir = '.';
const files = fs.readdirSync(dir).filter(f => f.endsWith('.html'));

const mapSrc = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3607.889373704391!2d55.314787599999995!3d25.2743066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e5f5d48af60ab1d%3A0x493855eba74fb50f!2sTRIFORCE%20ENTERPRISES%20LLC!5e0!3m2!1sen!2sin!4v1782023748562!5m2!1sen!2sin";

const footerMapReplacement = '<iframe src="' + mapSrc + '" width="100%" height="200" style="border:0; border-radius:8px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';

// Update contact.html map section
try {
  let contactContent = fs.readFileSync('contact.html', 'utf-8');
  // Regex to find the iframe in the map-section
  const iframeRegex = /<iframe[^>]*src="https:\/\/www\.google\.com\/maps\/embed[^>]*><\/iframe>/;
  const newContactIframe = '<iframe src="' + mapSrc + '" width="100%" height="450" style="border:0; filter: grayscale(100%) contrast(1.2);" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>';
  
  if (iframeRegex.test(contactContent)) {
    contactContent = contactContent.replace(iframeRegex, newContactIframe);
  }
  fs.writeFileSync('contact.html', contactContent, 'utf-8');
  console.log('Updated map section in contact.html');
} catch (e) {
  console.log('Error updating contact.html:', e);
}

// Update footer map in all HTML files
files.forEach(file => {
  let content = fs.readFileSync(file, 'utf-8');
  const footerMapImgRegex = /<img src="map-placeholder\.svg" alt="Map Location">/;
  
  if (footerMapImgRegex.test(content)) {
    content = content.replace(footerMapImgRegex, footerMapReplacement);
    fs.writeFileSync(file, content, 'utf-8');
    console.log('Updated footer map in ' + file);
  }
});
