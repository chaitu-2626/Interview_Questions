# 🧾 JavaScript Variables Cheat Sheet

## 🧠 What Are Variables?

> Variables are **named containers** for storing data in memory during program execution.

---

## ✨ Variable Keywords

| Keyword | Scope    | Reassignment | Hoisting | Temporal Dead Zone | Use Case                     |
| ------- | -------- | ------------ | -------- | ------------------ | ---------------------------- |
| `var`   | Function | ✅ Yes        | ✅ Yes    | ❌ No               | Legacy code, not recommended |
| `let`   | Block    | ✅ Yes        | 🚫 No    | ✅ Yes              | Use when value changes       |
| `const` | Block    | 🚫 No        | 🚫 No    | ✅ Yes              | Use for constants and safety |

---

## 🔧 Syntax

```js
var name = "Alice";   // Function-scoped
let age = 30;         // Block-scoped
const PI = 3.14;      // Block-scoped, immutable
```

---

## 🧩 Hoisting Explained

```js
console.log(x);  // undefined
var x = 10;

console.log(y);  // ReferenceError
let y = 20;
```

> 🧠 `var` is hoisted as `undefined`, `let` & `const` hoisted to TDZ (Temporal Dead Zone)

---

## 📦 Scope Types

| Type     | Description                          |
| -------- | ------------------------------------ |
| Global   | Accessible everywhere                |
| Function | Only inside the function             |
| Block    | Inside `{}` (e.g., loops, ifs, etc.) |

```js
function foo() {
  var x = 1;       // function-scoped
  let y = 2;       // block-scoped
  const z = 3;
}
```

---

## ♻️ Reassignment Rules

```js
let a = 10;
a = 20;            // ✅ Okay

const b = 5;
b = 15;            // ❌ TypeError
```

> 🧠 `const` means *immutable binding*, not immutable value (see below):

```js
const obj = { name: "John" };
obj.name = "Jane";     // ✅ Still allowed!
```

---

## 🚫 Common Pitfalls

* ❗ Using `var` inside loops:

  ```js
  for (var i = 0; i < 3; i++) {
    setTimeout(() => console.log(i), 1000);
  }
  // Outputs: 3 3 3
  ```

* ✅ Use `let` or `const` to fix block-scoping:

  ```js
  for (let i = 0; i < 3; i++) {
    setTimeout(() => console.log(i), 1000);
  }
  // Outputs: 0 1 2
  ```

---

## 🧠 Pro Interview Tips

* Use `const` by default; switch to `let` only when reassignment is needed.
* Avoid `var` — it introduces bugs due to hoisting & function-scope quirks.
* Understand the **Temporal Dead Zone** to explain `ReferenceError` clearly.

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ **Which keyword should you use if you never reassign?**

✅ **What is the Temporal Dead Zone?**

✅ **Why avoid `var` in modern JavaScript?**

✅ **Can `const` objects be mutated?**


