# 🧾 JavaScript `Map`, `WeakMap`, `Set`, `WeakSet` Cheat Sheet

## 🗺️ `Map` — Key-Value Pairs with Any Key Type

### ✅ Why Use `Map`?

* Keys can be **any type** (not just strings like in objects)
* Maintains **insertion order**
* More predictable for frequent addition/removal of entries

### 🔧 Creating a Map

```js
const map = new Map();
```

### 📚 Common `Map` Methods

| Method            | Description                   |
| ----------------- | ----------------------------- |
| `set(key, value)` | Adds/updates a key-value pair |
| `get(key)`        | Returns value for key         |
| `has(key)`        | Returns `true` if key exists  |
| `delete(key)`     | Removes a key-value pair      |
| `clear()`         | Removes all entries           |
| `size`            | Number of entries             |

### 🔁 Iterating over Map

```js
map.forEach((val, key) => console.log(key, val));
for (let [key, val] of map) console.log(key, val);
```

---

## 💀 `WeakMap` — Key-Value Store with Only Object Keys

### ✅ Why Use `WeakMap`?

* Keys must be **objects only**
* References are **weak** → do not prevent garbage collection
* Useful for **private data** or **memory-safe caching**

### ⚠️ Limitations:

* Not iterable
* No `size`, `clear()`, or `keys()` methods

### 📚 `WeakMap` Methods

| Method            | Description               |
| ----------------- | ------------------------- |
| `set(obj, value)` | Sets value for object key |
| `get(obj)`        | Gets value                |
| `has(obj)`        | Checks if key exists      |
| `delete(obj)`     | Deletes entry             |

```js
const wm = new WeakMap();
let obj = {};
wm.set(obj, "secret");
wm.get(obj); // "secret"
```

---

## 📦 `Set` — Collection of Unique Values

### ✅ Why Use `Set`?

* Stores **only unique values**
* Fast lookups
* Maintains **insertion order**
* Can hold **any type**

### 🔧 Creating a Set

```js
const set = new Set([1, 2, 2, 3]);  // => Set { 1, 2, 3 }
```

### 📚 Common `Set` Methods

| Method          | Description                             |
| --------------- | --------------------------------------- |
| `add(value)`    | Adds value (ignored if already present) |
| `has(value)`    | Checks if value exists                  |
| `delete(value)` | Removes value                           |
| `clear()`       | Empties the set                         |
| `size`          | Number of unique values                 |

### 🔁 Iterating over Set

```js
set.forEach(val => console.log(val));
for (let val of set) console.log(val);
```

---

## 💀 `WeakSet` — Set of Objects (Weak References)

### ✅ Why Use `WeakSet`?

* Only stores **object references**
* Weak reference: no memory leak
* Useful for **tracking object presence**

### ⚠️ Limitations:

* Not iterable
* No `size`, `forEach()`, `clear()`

### 📚 `WeakSet` Methods

| Method        | Description       |
| ------------- | ----------------- |
| `add(obj)`    | Adds object       |
| `has(obj)`    | Checks if present |
| `delete(obj)` | Removes object    |

```js
const ws = new WeakSet();
let obj = {};
ws.add(obj);
ws.has(obj);  // true
```

---

## 🔥 Quick Differences Summary

| Feature           | `Map` | `WeakMap` | `Set` | `WeakSet` |
| ----------------- | ----- | --------- | ----- | --------- |
| Key Types         | Any   | Object    | n/a   | Object    |
| Value Types       | Any   | Any       | Any   | Object    |
| Iteration         | ✅ Yes | ❌ No      | ✅ Yes | ❌ No      |
| Size Property     | ✅ Yes | ❌ No      | ✅ Yes | ❌ No      |
| Garbage-Collected | ❌ No  | ✅ Yes     | ❌ No  | ✅ Yes     |

---

## 🔥 Rapid-Fire Interview Questions (Self-Test)

✅ Why is `WeakMap` useful for memory management?

✅ How do you remove duplicates using a `Set`?

✅ What's the difference between `Map` and plain object for storing key-value pairs?

✅ Can you loop through a `WeakSet`?

✅ What type of keys does `Map` allow vs `WeakMap`?