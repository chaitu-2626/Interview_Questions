# 🧩 Critical Rendering Path (CRP) Cheat Sheet

> “The steps a browser takes to convert your HTML, CSS, and JS into what the user sees.”

---

## 🛠️ What Is the Critical Rendering Path?

It’s the **sequence of steps** a browser goes through to:

1. **Parse HTML**
2. **Construct DOM & CSSOM**
3. **Build the Render Tree**
4. **Layout elements**
5. **Paint pixels on screen**

🎯 Optimizing this path = **faster rendering** = better user experience!

---

## 📊 The 6 Key Steps in CRP

| Step                            | Description                                | Output                |
| ------------------------------- | ------------------------------------------ | --------------------- |
| 1. **HTML Parsing**             | Parse HTML into DOM                        | 🧱 DOM Tree           |
| 2. **CSS Parsing**              | Parse CSS into CSSOM                       | 🎨 CSSOM Tree         |
| 3. **JavaScript Blocking**      | JS can block HTML/CSS parsing if not async | ⛔ Blocks CRP          |
| 4. **Render Tree Construction** | Combine DOM + CSSOM                        | 🌲 Render Tree        |
| 5. **Layout**                   | Calculate positions and sizes              | 📐 Layout (Reflow)    |
| 6. **Paint**                    | Convert layout to pixels                   | 🖼️ Painted on screen |

---

## 🖼️ Diagram Summary

```
HTML --> DOM
CSS  --> CSSOM
JS   --> Blocks parsing (unless async/defer)

DOM + CSSOM => Render Tree
Render Tree => Layout => Paint => Screen!
```

---

## ⚠️ Why CRP Is Important?

| Issue                 | Result                     |
| --------------------- | -------------------------- |
| ❌ Render-blocking CSS | Slower First Paint         |
| ❌ Unoptimized JS      | Slower Time to Interactive |
| ❌ Large DOM or styles | Heavy layout & paint time  |

---

## 🚀 Optimization Techniques

| Goal                          | How To Achieve It                                |
| ----------------------------- | ------------------------------------------------ |
| ✅ Speed Up First Paint        | Inline critical CSS in `<head>`                  |
| ✅ Avoid CSS Blocking          | Load non-critical CSS async (`preload + onload`) |
| ✅ Minimize JS Blocking        | Use `async` or `defer` for JS                    |
| ✅ Reduce DOM/CSSOM Complexity | Simplify markup, avoid deeply nested styles      |
| ✅ Cache static assets         | Use HTTP caching + compression (GZIP/Brotli)     |

---

## 🔧 Quick Code Examples

### Inline Critical CSS

```html
<style>
  body { margin: 0; font-family: system-ui; }
  .hero { height: 100vh; background: url(hero.jpg); }
</style>
```

### Async/Defer JS

```html
<script src="app.js" defer></script>
```

### Load Non-Critical CSS Asynchronously

```html
<link rel="preload" href="styles.css" as="style" onload="this.onload=null;this.rel='stylesheet';">
<noscript><link rel="stylesheet" href="styles.css"></noscript>
```

---

## 📈 Metrics You Can Improve with CRP Optimization

| Metric                            | Affected by CRP? |
| --------------------------------- | ---------------- |
| 🖼️ First Contentful Paint (FCP)  | ✅ Yes            |
| 🚦 Largest Contentful Paint (LCP) | ✅ Yes            |
| ⚙️ Time to Interactive (TTI)      | ✅ Yes            |
| 💯 Lighthouse Performance Score   | ✅ Yes            |

---

## 🔍 Tools to Analyze CRP

| Tool                                 | Purpose                          |
| ------------------------------------ | -------------------------------- |
| 🧪 Chrome DevTools → Performance tab | See full CRP timeline            |
| 📊 Lighthouse                        | CRP audit + suggestions          |
| ⛅ WebPageTest                        | Waterfall of resource loading    |
| 🧰 PageSpeed Insights                | Real-world field data & CRP tips |

---

## 🏁 TL;DR Summary

| 🔄 CRP Step   | Speed Tip                             |
| ------------- | ------------------------------------- |
| HTML → DOM    | Keep HTML minimal                     |
| CSS → CSSOM   | Inline above-the-fold styles          |
| JS Blocks CRP | Use `defer` / `async` / split bundles |
| Render Tree   | Avoid complex styles & animations     |
| Layout        | Use simpler, consistent layout models |
| Paint         | Minimize heavy graphics or shadows    |

---

## ✅ Bonus: Critical CSS Tools

| Tool                                                 | Use Case                      |
| ---------------------------------------------------- | ----------------------------- |
| [Critical](https://github.com/addyosmani/critical)   | Extract & inline critical CSS |
| [Penthouse](https://github.com/pocketjoso/penthouse) | Generate critical CSS         |
| \[Chrome DevTools Coverage tab]                      | Find unused CSS & JS          |
