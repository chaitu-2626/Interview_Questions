# 🎨 CSS Async Loading Cheat Sheet

> “Load stylesheets **without blocking** page rendering.”

---

## 🧠 Why Load CSS Asynchronously?

By default:

```html
<link rel="stylesheet" href="style.css">
```

⛔ This **blocks rendering** until the CSS is fully downloaded and parsed.

This leads to:

* ❌ Slower **First Contentful Paint (FCP)**
* ❌ Poor **Lighthouse** performance score

✅ Async loading fixes that by letting the page render while the CSS is still downloading in the background.

---

## ⚙️ Common Async CSS Loading Techniques

| Technique                       | When to Use                 | Blocking? | Recommended? |
| ------------------------------- | --------------------------- | --------- | ------------ |
| `<link rel="preload">` + onload | ✅ Modern, safe, simple      | ❌ No      | ✅ Yes        |
| JavaScript-based loader         | 🧠 Fallback or full control | ❌ No      | ⚠️ Maybe     |
| Critical CSS + lazy load rest   | 🏎️ Best performance        | ❌ No      | ✅ Best       |

---

## ✅ Technique 1: Preload + Onload

```html
<link rel="preload" href="style.css" as="style" onload="this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="style.css"></noscript>
```

🧠 What it does:

* Preloads CSS in background
* Applies it once loaded
* `<noscript>` fallback ensures support for JS-disabled browsers

✅ Safe

✅ Minimal JavaScript

✅ Works in modern browsers

---

## 🛠️ Technique 2: Load CSS via JavaScript

```html
<script>
  const link = document.createElement("link");
  link.rel = "stylesheet";
  link.href = "style.css";
  document.head.appendChild(link);
</script>
```

📦 Use this if you want **full control** (e.g., conditional or delayed load)

⚠️ Not SEO-friendly unless you use Critical CSS
⚠️ Requires JS to be enabled

---

## 🚀 Technique 3: Critical CSS + Lazy Load Full Styles

1. **Inline critical styles in `<head>`**
2. **Load rest of the CSS async**

### Example:

```html
<style>
  /* Critical CSS */
  body { font-family: system-ui; margin: 0; }
  header { background: #000; color: white; padding: 1rem; }
</style>

<link rel="preload" href="styles.css" as="style" onload="this.onload=null;this.rel='stylesheet';">
<noscript><link rel="stylesheet" href="styles.css"></noscript>
```

✅ Best of both worlds:

* Fast initial render
* Full styling loads seamlessly afterward

---

## 🧪 Bonus: Load CSS When Needed (On Interaction)

```js
document.getElementById("loadMoreBtn").addEventListener("click", () => {
  const link = document.createElement("link");
  link.rel = "stylesheet";
  link.href = "additional.css";
  document.head.appendChild(link);
});
```

🎯 Load styles only when a specific feature/page section is needed

---

## 📊 Visual Summary

```text
Without Async:
[ HTML Parse ] → [ CSS Download ] → [ Render Page ]

With Async:
[ HTML Parse ] → [ Render Page ] → [ CSS Loads in BG ]
```

---

## 📈 Performance Benefits

| Metric                          | Boost with Async CSS |
| ------------------------------- | -------------------- |
| 🚀 First Contentful Paint (FCP) | ✅ Faster visual load |
| 📉 Time to Interactive (TTI)    | ✅ Faster interaction |
| 💡 Lighthouse CSS hints         | ✅ Passed warnings    |

---

## 🔍 Best Practices

✅ Use `preload + onload` for async loading

✅ Always include `<noscript>` fallback

✅ Inline critical CSS in `<head>`

❌ Don’t async-load CSS required **above the fold**

✅ Test with tools: Lighthouse, WebPageTest, DevTools

---

## 🧩 Tools to Extract Critical CSS

| Tool                                               | Use Case                  |
| -------------------------------------------------- | ------------------------- |
| [Critical](https://github.com/addyosmani/critical) | Extract critical-path CSS |
| [PurgeCSS](https://purgecss.com/)                  | Remove unused CSS         |
| [UnCSS](https://github.com/uncss/uncss)            | Strip unused styles       |

---

## 🏁 TL;DR Summary Table

| Method                     | Blocking? | Browser Support | Use Case                       |
| -------------------------- | --------- | --------------- | ------------------------------ |
| `<link rel="preload" ...>` | ❌ No      | ✅ Modern        | General async CSS load         |
| JS Dynamic Inject          | ❌ No      | ✅ All (with JS) | Conditional load / features    |
| Critical + Lazy            | ❌ No      | ✅ Best practice | High-perf apps & landing pages |