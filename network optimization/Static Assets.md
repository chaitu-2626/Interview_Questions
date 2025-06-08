## Why Traditionally Serve Site Assets from Multiple Domains?

## 🧠 The Basic Idea

> "Serving assets (images, JS, CSS) from **multiple domains** used to **speed up page loading**."

This was mainly due to **browser limitations** — specifically, how many files (connections) a browser could **download at once** per domain.

---

## 📦 Example Scenario

Imagine your page loads:

* 50 images
* 10 JavaScript files
* 3 CSS stylesheets

If they’re all on the **same domain** (e.g., `www.example.com`), browser limits slow you down.

---

## ⚠️ Key Limitation (Before HTTP/2)

| Browser Limitation (HTTP/1.1) | Max Concurrent Connections Per Domain |
| ----------------------------- | ------------------------------------- |
| Chrome / Firefox / Safari     | 6                                     |
| Internet Explorer 9           | 2                                     |

So if you had **20 assets**, only 6 would download in parallel — the rest had to **wait**.

---

## 💡 Solution: Domain Sharding

> Put assets on **multiple subdomains** to bypass this connection limit.

### Example:

```text
images1.example.com → 6 parallel downloads  
images2.example.com → 6 more in parallel  
cdn.example.com     → 6 more…
```

✅ More domains = more parallel downloads

✅ Faster page rendering (especially for image-heavy pages)

---

## 🖼️ Diagram

```
           Browser
              |
         ┌────┴─────┐
         ▼          ▼
cdn1.example.com   cdn2.example.com
   ↳ image1.png      ↳ image2.png
   ↳ style.css       ↳ script.js
   ↳ script1.js      ↳ script2.js
```

---

## ⚙️ Implementation Pattern

```html
<img src="https://cdn1.example.com/img1.jpg" />
<img src="https://cdn2.example.com/img2.jpg" />
<script src="https://cdn3.example.com/app.js"></script>
```

🔁 Round-robin asset hosting

💥 Known as **domain sharding**

---

## 📈 Benefits (Traditionally)

| ✅ Benefit                   | 📋 Explanation                           |
| --------------------------- | ---------------------------------------- |
| More parallel downloads     | Bypass per-domain connection limits      |
| Faster image/script loading | Useful for heavy websites                |
| Works well with CDNs        | Subdomains can be served from edge nodes |

---

## 🚧 Downsides

| ⚠️ Issue             | 🧨 Why It Happens                    |
| -------------------- | ------------------------------------ |
| Extra DNS lookups    | Each domain must be resolved         |
| More SSL handshakes  | Each domain needs its own connection |
| Harder cache control | Cache behavior differs per subdomain |
| Not useful in HTTP/2 | Multiplexing handles this better now |

---

## 🔄 With Modern Web (HTTP/2 & HTTP/3)

### HTTP/2 & HTTP/3 support **multiplexing**:

* Multiple files over **a single connection**
* ✅ No need for multiple domains
* ❌ Domain sharding **hurts** performance due to:

  * More TLS handshakes
  * More DNS overhead

### ✅ Best Practice Today:

* Serve all assets from **one domain** (or CDN) with HTTP/2/3
* Use **resource hints** (e.g., `preconnect`, `dns-prefetch`)
* Enable **compression**, **caching**, and **HTTP/2 push** (where available)

---

## 🏁 TL;DR Summary

| Then (HTTP/1.1)                    | Now (HTTP/2 & HTTP/3)                |
| ---------------------------------- | ------------------------------------ |
| ⛓️ 6 connections per domain        | 🌐 Multiplexed over 1 connection     |
| ✅ Use multiple domains             | ❌ Avoid domain sharding              |
| ⚡ Faster with many subdomains      | 🐢 Slower due to connection overhead |
| Used `cdn1.example.com`, `cdn2...` | Use a single optimized CDN domain    |

---

## 💬 Final Tip

If you’re using a modern CDN (like Cloudflare, Akamai, Fastly) + HTTP/2 or HTTP/3:

**Stick to a single domain**
✅ It’s simpler

✅ More cacheable

✅ TLS handshakes are reused

✅ Faster overall