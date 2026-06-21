const fs = require('fs');

let content = fs.readFileSync('index.html', 'utf-8');

// The user wants it to be very attractive and link to products.html.
// We will update the CSS.

const newStyles = `
          /* Ultra Premium Product Cards */
          .premium-product-card {
            position: relative;
            border-radius: 20px;
            background: #fff;
            box-shadow: 0 15px 35px rgba(0,0,0,0.08);
            transition: all 0.5s cubic-bezier(0.25, 1, 0.5, 1);
            display: flex;
            flex-direction: column;
            min-width: 320px;
            height: 400px;
            flex-shrink: 0;
            overflow: hidden;
            text-decoration: none;
            color: #fff;
            cursor: pointer;
            border: none;
          }

          .premium-product-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: 0 25px 50px rgba(220, 38, 38, 0.2); /* Deep red glow */
          }

          .premium-img-wrapper {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
            background-color: #fff;
          }

          .premium-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.8s cubic-bezier(0.25, 1, 0.5, 1);
          }

          .premium-product-card:hover .premium-img-wrapper img {
            transform: scale(1.15);
          }

          /* Dark gradient overlay for text readability */
          .premium-product-card::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.4) 40%, rgba(0,0,0,0) 100%);
            z-index: 2;
            transition: background 0.5s ease;
          }

          .premium-product-card:hover::before {
            background: linear-gradient(to top, rgba(220, 38, 38, 0.95) 0%, rgba(0,0,0,0.5) 50%, rgba(0,0,0,0) 100%);
          }

          .premium-card-content {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 30px;
            z-index: 3;
            transform: translateY(20px);
            transition: transform 0.5s cubic-bezier(0.25, 1, 0.5, 1);
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
          }

          .premium-product-card:hover .premium-card-content {
            transform: translateY(0);
          }

          .premium-card-content h3 {
            font-size: 24px;
            font-weight: 800;
            color: #ffffff;
            margin: 0 0 10px 0;
            line-height: 1.3;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
          }

          .premium-card-content .view-btn {
            display: inline-flex;
            align-items: center;
            font-size: 14px;
            font-weight: 600;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
            opacity: 0;
            transform: translateY(10px);
            transition: all 0.4s ease;
            transition-delay: 0.1s;
          }

          .premium-card-content .view-btn i {
            margin-left: 8px;
            transition: transform 0.3s ease;
          }

          .premium-product-card:hover .premium-card-content .view-btn {
            opacity: 1;
            transform: translateY(0);
          }

          .premium-product-card:hover .premium-card-content .view-btn i {
            transform: translateX(5px);
          }
`;

// replace old styles with new
let styleStart = content.indexOf('.premium-product-card {');
if (styleStart !== -1) {
  let styleEnd = content.indexOf('</style>', styleStart);
  content = content.substring(0, styleStart) + newStyles + content.substring(styleEnd);
}

// Ensure all links point directly to products.html
content = content.replace(/href="new_products\.html[^"]*"/g, 'href="products.html"');
content = content.replace(/href="products\.html#[a-z]+"/g, 'href="products.html"');

// Wait, the previous markup had:
/*
<div class="premium-card-content">
  <h3>...</h3>
</div>
*/
// Let's add the view-btn inside the content
content = content.replace(/<\/h3>\s*<\/div>/g, '</h3>\n                <span class="view-btn">View Products <i class="fa-solid fa-arrow-right"></i></span>\n              </div>');

fs.writeFileSync('index.html', content, 'utf-8');
console.log('Done attractive design');
