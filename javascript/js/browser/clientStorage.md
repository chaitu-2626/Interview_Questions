# 📘 Cheat Sheet: Client Storage in JavaScript

## 🧠 What is Client-Side Storage?

> 🗂️ **Client-side storage** allows web applications to **store data in the browser**, enabling **offline access**, **state persistence**, and better **performance**.

---

## 🗃️ Types of Client Storage

| Type                  | Scope              | Persistent? | Capacity | Synchronous? | Best For                          |
| --------------------- | ------------------ | ----------- | -------- | ------------ | --------------------------------- |
| **Cookies** 🍪        | Sent with requests | ✅ Yes       | \~4KB    | ✅ Sync       | Auth/session tokens               |
| **LocalStorage** 💾   | Per domain         | ✅ Yes       | \~5–10MB | ✅ Sync       | User preferences, caching         |
| **SessionStorage** 🕒 | Per tab            | ❌ No        | \~5–10MB | ✅ Sync       | Data during one tab session       |
| **IndexedDB** 🗄️     | Per origin         | ✅ Yes       | >100MB+  | ❌ Async      | Structured, large, queryable data |
| **Cache API** ⚙️      | Per origin         | ✅ Yes       | Varies   | ❌ Async      | Caching files (for PWAs)          |

---

## 💾 1. **LocalStorage**

> ✅ Persistent until manually cleared
> ✅ Shared across tabs

```js
// 🔐 Set
localStorage.setItem('theme', 'dark');

// 🔍 Get
const theme = localStorage.getItem('theme');

// ❌ Remove
localStorage.removeItem('theme');

// 🧹 Clear all
localStorage.clear();
```

---

## 🕒 2. **SessionStorage**

> 🔁 Cleared when **tab or window** is closed

```js
sessionStorage.setItem('user', 'Alice');
sessionStorage.getItem('user');
sessionStorage.removeItem('user');
sessionStorage.clear();
```

---

## 🍪 3. **Cookies**

> 📡 Automatically sent with every HTTP request (if not `HttpOnly`)

```js
// Set cookie
document.cookie = "username=John; expires=Fri, 31 Dec 2025 23:59:59 GMT; path=/";

// Read cookies
console.log(document.cookie);

// Delete cookie
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
```

✅ Use `Secure`, `HttpOnly`, `SameSite` flags for security

---

## 🗄️ 4. **IndexedDB**

> 🧱 A **low-level** NoSQL database in the browser
> ✅ Async, structured storage, suitable for offline apps

```js
const request = indexedDB.open('myDB', 1);

request.onsuccess = function (event) {
  const db = event.target.result;
  const tx = db.transaction('users', 'readwrite');
  const store = tx.objectStore('users');
  store.put({ id: 1, name: 'Alice' });
};
```

* Built on **transactions**
* Supports **indexes**, **queries**, and **binary data**

---

## ⚙️ 5. **Cache API** (for service workers/PWAs)

> 📂 Used to store **responses** like HTML, CSS, JS, etc.

```js
caches.open('v1').then(cache => {
  cache.add('/index.html');
});

// Get from cache
caches.match('/index.html').then(response => {
  // Serve cached response
});
```

---

## 📌 Quick Comparison Table

| Feature         | Cookies 🍪 | localStorage 💾 | sessionStorage 🕒 | IndexedDB 🗄️ | Cache API ⚙️  |
| --------------- | ---------- | --------------- | ----------------- | ------------- | ------------- |
| Persistent      | ✅ Yes      | ✅ Yes           | ❌ No              | ✅ Yes         | ✅ Yes         |
| Storage Limit   | \~4KB      | \~5MB           | \~5MB             | 100MB+        | Large         |
| Data Type       | String     | String          | String            | Objects       | Responses     |
| Sync/Async      | Sync       | Sync            | Sync              | Async         | Async         |
| Accessible From | JS & HTTP  | JS only         | JS only           | JS only       | ServiceWorker |

---

## 🔐 Security Tips

* ❌ **Don’t store sensitive data** (like tokens) in `localStorage` or `sessionStorage`
* ✅ Use **`HttpOnly` cookies** for auth tokens
* ✅ Always use **`SameSite=Strict` or `Lax`** on cookies
* ⛔ Avoid `localStorage` for secure login/session data

---

## 🎯 Interview Pro Insight

> “Client storage in JavaScript ranges from simple key-value stores like `localStorage` to full databases like `IndexedDB`. Choose based on your use case: small config vs complex offline-first apps.”