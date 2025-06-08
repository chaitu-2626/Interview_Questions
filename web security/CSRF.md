### 🛡️ What is CSRF?

**Cross-Site Request Forgery (CSRF)** is a type of **attack that tricks a user into performing actions they didn’t intend to** — while they’re logged into a **trusted website**.

---

### 🧠 Imagine This:

You’re logged into your **bank account** in one tab.

Then you visit a **malicious website** in another tab. That bad website **silently sends a request** to your bank (e.g., to transfer money) **using your session**, because you’re still logged in.

---

### ⚠️ Why it works:

* The browser **automatically includes your cookies/session** with the forged request.
* The server **thinks the request is legit**, because it comes with valid authentication (your session).

---

### 🧬 Real-world analogy:

> Think of CSRF like someone **forging your signature** on a check while your ID is still lying on the desk.

---

### 📥 CSRF Attack Flow (Diagram)

Here’s a simple diagram of how it works:

```
+----------------+           +--------------------+         +---------------+
|   Victim User  |  <----->  |  Trusted Website   | <-----  |  Bad Website  |
+----------------+           +--------------------+         +---------------+
        |                           |                               |
        |     1. User logs in       |                               |
        |-------------------------->|                               |
        |    (session cookie set)   |                               |
        |                           |                               |
        |                           |                               |
        |      2. Visits bad site   |                               |
        |-------------------------->------------------------------> |
        |                           |    3. Bad site sends         |
        |                           |    fake request using        |
        |                           |    session cookie            |
        |                           | <-----------------------------|
        |                           |                               |
        |        4. Trusted site executes the action                |
```

---

### 💻 Example: CSRF Attack Code

Let’s say you’re logged into a site like `bank.com`.

Here’s an HTML snippet from a malicious site:

```html
<!-- Malicious code on attacker.com -->
<img src="https://bank.com/transfer?amount=1000&to=attacker" />
```

* When this image loads, it makes a **GET request** to `bank.com`.
* Your browser **includes your session cookie** with the request.
* If `bank.com` doesn’t protect against CSRF... 💸 money gone.

---

### 🛡️ How to Prevent CSRF

#### ✅ 1. **CSRF Tokens**

Generate a random token per user/request and validate it on the server.

```html
<!-- Form with CSRF token -->
<form method="POST" action="/transfer">
  <input type="hidden" name="csrf_token" value="random_token_123">
  <input type="text" name="amount" />
  <button type="submit">Transfer</button>
</form>
```

```python
# Server-side (Python Flask example)
@app.route('/transfer', methods=['POST'])
def transfer():
    if request.form['csrf_token'] != session['csrf_token']:
        abort(403)  # Forbidden!
```

#### ✅ 2. **SameSite Cookies**

Set `SameSite` attribute on cookies to prevent them from being sent in cross-site requests.

```http
Set-Cookie: session=abc123; SameSite=Strict; HttpOnly; Secure
```

#### ✅ 3. **Double Submit Cookies**

Send CSRF token in a cookie **and** in the request body — and check both match.

---

### 🚨 Important Notes:

* CSRF mostly affects **state-changing operations** (like changing email, password, transferring money).
* It doesn't usually affect **GET** requests, but always best to avoid unsafe GET actions.