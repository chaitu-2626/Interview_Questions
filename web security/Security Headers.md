# 🔐 Web Security Headers Cheat Sheet

| Header Name                                      | Purpose                                                         | Typical Values / Example                                    | What It Protects Against                                   |
| ------------------------------------------------ | --------------------------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------- |
| **Content-Security-Policy (CSP)**                | Controls which resources the browser can load                   | `default-src 'self'; script-src 'self' https://trusted.com` | Cross-Site Scripting (XSS), data injection, unsafe content |
| **Strict-Transport-Security (HSTS)**             | Forces HTTPS, prevents downgrade attacks                        | `max-age=31536000; includeSubDomains; preload`              | Man-in-the-middle (MITM), SSL stripping                    |
| **X-Content-Type-Options**                       | Prevents MIME sniffing by browser                               | `nosniff`                                                   | Drive-by downloads, content sniffing bugs                  |
| **X-Frame-Options**                              | Controls whether site can be framed                             | `DENY` or `SAMEORIGIN`                                      | Clickjacking                                               |
| **Referrer-Policy**                              | Controls what referrer info is sent                             | `no-referrer`, `strict-origin-when-cross-origin`            | Privacy leakage                                            |
| **Permissions-Policy** (formerly Feature-Policy) | Controls access to browser features (camera, geolocation, etc.) | `geolocation=(), microphone=()`                             | Limits access to sensitive features                        |
| **Set-Cookie** (with flags)                      | Controls cookie behavior                                        | `Secure; HttpOnly; SameSite=Strict`                         | Session hijacking, CSRF                                    |
| **Expect-CT**                                    | Enforces Certificate Transparency                               | `max-age=86400, enforce`                                    | Detects fraudulent SSL certs                               |
| **Cross-Origin-Resource-Policy (CORP)**          | Controls resource sharing from other origins                    | `same-origin`                                               | Cross-origin data leaks                                    |
| **Cross-Origin-Opener-Policy (COOP)**            | Isolates browsing contexts                                      | `same-origin`                                               | Prevents cross-origin attacks                              |
| **Cross-Origin-Embedder-Policy (COEP)**          | Controls which cross-origin resources can be loaded             | `require-corp`                                              | Enables secure cross-origin isolation                      |

---

# 📌 Quick Explanations & Recommendations

### 1. **Content-Security-Policy (CSP)**

* The most powerful header.
* Whitelist where scripts, images, styles, fonts, etc. can load from.
* Protects against XSS and data injection.

### 2. **Strict-Transport-Security (HSTS)**

* Tell browsers to ONLY connect via HTTPS.
* Protects against SSL stripping.

### 3. **X-Content-Type-Options: nosniff**

* Stops browsers from guessing the content type.
* Prevents some drive-by download attacks.

### 4. **X-Frame-Options**

* Prevents your site from being embedded in iframes.
* Protects against clickjacking.

### 5. **Referrer-Policy**

* Controls privacy around URLs shared via `Referer` header.
* Use to prevent leaking sensitive URLs on third-party requests.

### 6. **Permissions-Policy**

* Restrict access to browser features like camera, microphone, etc.
* Helps protect user privacy.

### 7. **Set-Cookie** Flags

* `HttpOnly`: Prevents JavaScript access to cookies.
* `Secure`: Sends cookie only over HTTPS.
* `SameSite`: Helps prevent CSRF.

---

# 🧩 Example of Secure HTTP Headers

```http
Content-Security-Policy: default-src 'self'; script-src 'self' https://cdn.example.com; object-src 'none'; base-uri 'self';
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Referrer-Policy: no-referrer-when-downgrade
Permissions-Policy: geolocation=(), microphone=()
Set-Cookie: session=abc123; Secure; HttpOnly; SameSite=Strict
```

---

# 📖 Summary Table

| Header                 | Protects Against        | Notes                            |
| ---------------------- | ----------------------- | -------------------------------- |
| CSP                    | XSS, content injection  | Complex but worth implementing   |
| HSTS                   | SSL stripping           | Use only if HTTPS is enforced    |
| X-Content-Type-Options | MIME sniffing attacks   | Simple and highly recommended    |
| X-Frame-Options        | Clickjacking            | Use `DENY` or `SAMEORIGIN`       |
| Referrer-Policy        | URL privacy leaks       | Configure based on privacy needs |
| Permissions-Policy     | Browser API abuse       | Limit dangerous feature access   |
| Set-Cookie Flags       | Session hijacking, CSRF | Always use for auth cookies      |