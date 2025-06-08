# 🧾 JavaScript Loops Cheat Sheet

## 🔁 Loop Types Overview

| Loop Type    | Use Case                             | Can Break? | Iterates Over                   |
| ------------ | ------------------------------------ | ---------- | ------------------------------- |
| `for`        | When you know how many times to loop | ✅          | Numbers / Indexes               |
| `while`      | Loop until condition is false        | ✅          | Based on condition              |
| `do...while` | Executes at least once               | ✅          | Based on condition              |
| `for...of`   | Loop through values of iterable      | ✅          | Arrays, Strings, Sets           |
| `for...in`   | Loop through keys (enumerable props) | ✅          | Objects, Arrays (not preferred) |
| `.forEach()` | Array method, clean syntax           | ❌          | Arrays                          |

---

## 1️⃣ `for` Loop

```javascript
for (let i = 0; i < 5; i++) {
  console.log(i);
}
```

✅ Precise control
✅ Supports `break` and `continue`
🚫 Verbose for arrays and collections

---

## 2️⃣ `while` Loop

```javascript
let i = 0;
while (i < 5) {
  console.log(i);
  i++;
}
```

✅ Condition is checked before each loop
✅ Can create infinite loops if not careful

---

## 3️⃣ `do...while` Loop

```javascript
let i = 0;
do {
  console.log(i);
  i++;
} while (i < 5);
```

✅ Executes at least once, even if the condition is false

---

## 4️⃣ `for...of` (ES6+)

```javascript
for (const val of [10, 20, 30]) {
  console.log(val);
}
```

✅ Best for arrays, strings, sets, maps
✅ Cleaner syntax
❌ No access to index (unless using `.entries()`):

```javascript
for (const [index, value] of arr.entries()) {
  console.log(index, value);
}
```

---

## 5️⃣ `for...in`

```javascript
const obj = { a: 1, b: 2 };
for (const key in obj) {
  console.log(key, obj[key]);
}
```

✅ Use for looping over object keys
❌ Includes inherited properties
⚠️ Not recommended for arrays — prefer `for` or `for...of`

---

## 6️⃣ `.forEach()` (Array Method)

```javascript
[1, 2, 3].forEach((value, index) => {
  console.log(index, value);
});
```

✅ Cleaner syntax for array operations
❌ Cannot use `break` or `continue`
✅ Great when you don't need to exit early

---

## 🧪 Loop Control: `break` & `continue`

```javascript
for (let i = 0; i < 5; i++) {
  if (i === 3) break;       // exits loop
  if (i === 1) continue;    // skips this iteration
  console.log(i);
}
```

---

## 🚀 Looping Over Objects and Arrays

| Data Structure | Best Loop(s)                          | Notes                                       |
| -------------- | ------------------------------------- | ------------------------------------------- |
| Array          | `for`, `for...of`, `.forEach()`       | Prefer `for...of` for clean value iteration |
| Object         | `for...in`, `Object.keys().forEach()` | Watch for inherited keys with `for...in`    |
| Map            | `for...of`, `.forEach()`              | Iterates over `[key, value]` pairs          |
| Set            | `for...of`, `.forEach()`              | Iterates over values                        |
| String         | `for...of`                            | Iterates over characters                    |

---

## 🔥 Interview Quick Hits

✅ Can you use `break` inside `.forEach()`? → ❌ No
✅ Which loop runs at least once even if condition is false? → `do...while`
✅ How do you iterate over object properties safely? → `Object.keys(obj).forEach()`
✅ Best loop to iterate over values of a Set? → `for...of`
✅ Can you use `continue` in a `for...of` loop? → ✅ Yes

---

## 🧠 BONUS: Loop Alternatives for Objects

```javascript
const obj = { a: 1, b: 2 };

Object.entries(obj).forEach(([key, value]) => {
  console.log(key, value);
});

for (const [key, value] of Object.entries(obj)) {
  console.log(key, value);
}
```

---

## 💡 Pro Tips

✅ Use `for...of` for readability and fewer bugs
✅ Avoid `for...in` with arrays
✅ `.forEach()` is clean but not flexible (no `break`)
✅ Prevent infinite loops by updating condition variables properly