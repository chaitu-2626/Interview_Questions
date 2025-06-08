## 💣 What is XSS?

**Cross-Site Scripting (XSS)** is a type of attack where a hacker **injects malicious JavaScript** into a trusted website.

When another user visits that page, the browser runs the **evil script** — thinking it’s safe because it came from a trusted site.

---

### 🎬 Real-Life Analogy

> You write a review on a product site. But instead of plain text, someone writes a `<script>` that steals every visitor's cookies. That script gets stored and runs in **everyone’s** browser.

---

## 👨‍💻 Example of XSS Attack

Imagine a website shows user comments like this:

```html
<div>
  User Comment: <span>Great product!</span>
</div>
```

Now a hacker submits this:

```html
<script>alert("You’ve been hacked!")</script>
```

If the site **doesn't escape this input**, this becomes:

```html
<div>
  User Comment: <span><script>alert("You’ve been hacked!")</script></span>
</div>
```

🔔 The script runs in the browser when someone visits the page!

---

## ⚔️ Types of XSS

### 1. 🧠 **Stored XSS**

Malicious script is saved in the **database**, shown to all users.
👉 Worst kind. Most persistent.

### 2. 🧪 **Reflected XSS**

The script is part of a URL or request and **bounces back** in the response.
👉 Common in search pages or login errors.

```url
https://example.com/search?q=<script>alert(1)</script>
```

### 3. 🚚 **DOM-Based XSS**

The vulnerability exists **in the JavaScript code on the page itself** (e.g., reading from `location.href`).

---

## ⚠️ What Can Hackers Do With XSS?

* Steal cookies or session tokens
* Hijack user accounts
* Deface the site
* Redirect users to phishing pages
* Install malware

---

## 🛡️ How to Prevent XSS

### ✅ 1. **Escape Output (Sanitize HTML)**

Always **escape special characters** like `<`, `>`, `"`, `'`, etc.

Example in JavaScript (React auto-escapes):

```js
const safeComment = escape(userInput); // Avoid direct innerHTML use
```

In back-end templates (e.g., Django, Flask, etc.), use built-in escaping:

```html
{{ user_input }}  <!-- Escaped by default -->
```

---

### ✅ 2. **Use Content Security Policy (CSP)**

CSP is a browser feature that tells the browser:

> "Only run scripts from these trusted sources."

```http
Content-Security-Policy: default-src 'self'; script-src 'self'
```

⛔ Blocks inline `<script>` and third-party malicious code.

---

### ✅ 3. **Avoid `innerHTML` and `document.write`**

These allow raw HTML/JS to be inserted:

```js
// ❌ BAD
element.innerHTML = userInput;

// ✅ GOOD
element.textContent = userInput;
```

---

### ✅ 4. **Sanitize Input (e.g. DOMPurify)**

If you need to allow **some HTML** (e.g., bold text in comments), use a sanitizer:

```js
const clean = DOMPurify.sanitize(userInput);
```

---

### ✅ 5. **HTTP-Only Cookies**

Make your session cookies **inaccessible to JavaScript**, to prevent cookie theft:

```http
Set-Cookie: session=abc123; HttpOnly; Secure
```

---

## 📊 Visual: XSS Flow (Stored XSS Example)

```
+-------------+             +--------------+           +------------+
|   Attacker  |  --(1)-->   |  Website DB  |  --(2)--> |   Victim   |
| Posts XSS   |             | Stores Script|           | Loads Page |
+-------------+             +--------------+           +------------+
                                                  |
                                            <script runs in browser>
                                                  |
                                           -> Steals session cookie
```

---

## 🧪 Test It Yourself

You can test XSS safely using:

* [https://xss-game.appspot.com](https://xss-game.appspot.com) by Google
* [PortSwigger Labs (Burp Suite)](https://portswigger.net/web-security/cross-site-scripting)

---

## ✅ TL;DR — How to Stay Safe

| Defense                 | What It Does                                |
| ----------------------- | ------------------------------------------- |
| Escape Output           | Prevents scripts from rendering             |
| Sanitize Input          | Removes dangerous tags/scripts              |
| Content Security Policy | Restricts what scripts the browser can load |
| HttpOnly Cookies        | Prevents JavaScript from reading cookies    |
| Avoid `innerHTML`       | Don’t inject raw HTML                       |