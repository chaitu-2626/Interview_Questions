# 🚦 Resource Hinting Cheat Sheet

> “Give the browser clues about what’s coming next — so it can prepare early.”

---

## 🧠 What is Resource Hinting?

When a browser loads your website, it doesn't know in advance:

* Where you'll fetch data from
* Which fonts you’ll load
* What images/videos are coming next

⚠️ This creates **delays**.

**Resource hints** let you say:

> “Hey browser! You’ll need this resource soon. Start preparing.”

---

## 🛠️ Common Resource Hints

| Hint Type         | Purpose                                       | HTML Example                                             |
| ----------------- | --------------------------------------------- | -------------------------------------------------------- |
| 🔍 `dns-prefetch` | Resolve domain name early                     | `<link rel="dns-prefetch" href="//cdn.example.com">`     |
| 🚪 `preconnect`   | Open a network connection early               | `<link rel="preconnect" href="https://cdn.example.com">` |
| ⏱️ `prefetch`     | Fetch low-priority resource for future use    | `<link rel="prefetch" href="/next-page.html">`           |
| ⏩ `preload`       | Load high-priority resource ASAP              | `<link rel="preload" href="main.css" as="style">`        |
| 🖼️ `prerender`   | Load and render a full page in the background | `<link rel="prerender" href="/checkout">`                |

---

## 🔧 Resource Hint Types Explained (Simple)

### 1. 🔍 `dns-prefetch`

💡 Resolve the domain name before it's needed.

```html
<link rel="dns-prefetch" href="//fonts.googleapis.com">
```

**Use it when**: Your page loads stuff from other domains (like Google Fonts, CDNs).

---

### 2. 🚪 `preconnect`

💡 Tell the browser to open a connection (DNS + TCP + TLS) early.

```html
<link rel="preconnect" href="https://cdn.example.com">
```

**Use it when**: You load critical stuff (like fonts or API calls) from another domain.

✅ Faster time to first byte
✅ Less wait for important content

---

### 3. ⏩ `preload`

💡 Load something **right now**, even before it appears in HTML.

```html
<link rel="preload" href="main.css" as="style">
```

**Use it for**:

* Fonts
* Stylesheets
* Scripts
* Images above-the-fold

📝 Important: Always specify `as="..."` (e.g., `as="font"`).

---

### 4. ⏱️ `prefetch`

💡 Load **non-critical** assets you’ll need **soon** (e.g., next page).

```html
<link rel="prefetch" href="/next-page.html">
```

**Use it for**:

* Scripts or data for next pages
* Images or templates for upcoming views

---

### 5. 🖼️ `prerender`

💡 Actually **render** the next page in the background.

```html
<link rel="prerender" href="/thank-you">
```

🚀 On click, the page shows **instantly**

⚠️ Very heavy — use for high-confidence next steps only (e.g., after checkout).

---

## 📊 Visual Summary

```text
User opens page
|
|--- dns-prefetch ---------▶ DNS resolved early
|--- preconnect -----------▶ Connection ready
|--- preload --------------▶ Load needed things fast
|--- prefetch -------------▶ Load stuff for next page
|--- prerender ------------▶ Load & render next page
```

---

## ✅ Quick Recommendations

| Goal                        | Use This Hint                           |
| --------------------------- | --------------------------------------- |
| Faster font load            | `preconnect + preload` for Google Fonts |
| CDN resource optimization   | `dns-prefetch + preconnect`             |
| Improve Time to Interactive | `preload` JS or critical CSS            |
| Smooth navigation           | `prefetch` next-page assets             |
| Instant page load on click  | `prerender` known next pages            |

---

## 🌍 Example in `<head>`

```html
<head>
  <!-- DNS and connection for fonts -->
  <link rel="dns-prefetch" href="//fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>

  <!-- Preload font -->
  <link rel="preload" href="/fonts/roboto.woff2" as="font" type="font/woff2" crossorigin>

  <!-- Prefetch a script for the next page -->
  <link rel="prefetch" href="/static/nextPage.bundle.js">

  <!-- Prerender the thank-you page -->
  <link rel="prerender" href="/thank-you">
</head>
```

---

## 🧪 Bonus: Chrome DevTools Tip

Open DevTools → Network tab
Look for `Initiator` → shows when preconnect or preload kicks in
Use Lighthouse to measure "Preload key requests" 💡

---

## ⚠️ Gotchas

| Issue                       | Solution                       |
| --------------------------- | ------------------------------ |
| Preload not working         | Use correct `as` attribute     |
| No effect from preconnect   | Domain might not be used early |
| Too much prefetch/prerender | Avoid overwhelming the network |

---

## 🧩 Tools to Help

* 🔍 [web.dev resource hints](https://web.dev/resource-hints/)
* ⚡ [Lighthouse](https://developers.google.com/web/tools/lighthouse) — audit preload & perf
* 📈 Chrome DevTools → Performance tab → Network loading order

---

## 🏁 TL;DR Summary

| Hint           | When to Use                      | Priority        |
| -------------- | -------------------------------- | --------------- |
| `dns-prefetch` | For external domains             | 🔽 Low          |
| `preconnect`   | Before calling CDN/API           | 🔼 Medium       |
| `preload`      | Fonts, CSS, JS needed right away | 🔝 High         |
| `prefetch`     | Load future page/data            | 🔽 Low          |
| `prerender`    | Pre-render entire next page      | 🔝 High (Heavy) |