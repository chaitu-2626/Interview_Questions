# 🧾 JavaScript Scope Cheat Sheet

## 🔍 What is Scope?

> **Scope** determines the **visibility** and **lifetime** of variables — where they can be accessed in code.

---

## 🧠 Types of Scope in JavaScript

| Scope Type         | Description                                        | Applies To                           |
| ------------------ | -------------------------------------------------- | ------------------------------------ |
| **Global Scope**   | Accessible anywhere                                | Declared outside all functions       |
| **Function Scope** | Accessible only within the function                | `var`, function parameters           |
| **Block Scope**    | Accessible only inside `{}`                        | `let`, `const`, `for`, `if`, etc.    |
| **Lexical Scope**  | Inner functions access variables from outer scopes | Defined by **where** code is written |

---

## 🌐 Global Scope

```js
let globalVar = "I’m global";

function check() {
  console.log(globalVar);  // ✅ Accessible
}
```

✅ All scripts share the global object (in browsers: `window`)

---

## 🔁 Function Scope

```js
function greet() {
  var message = "Hello";
  console.log(message);
}
console.log(message);  // ❌ ReferenceError
```

✅ `var` is **function-scoped** — visible only inside the function

---

## 📦 Block Scope

```js
if (true) {
  let a = 10;
  const b = 20;
}
console.log(a); // ❌ ReferenceError
```

✅ `let` and `const` are **block-scoped**

🚫 `var` is NOT block-scoped:

```js
if (true) {
  var x = 5;
}
console.log(x);  // ✅ 5
```

---

## 🧬 Lexical Scope (Closure)

> JS uses **lexical scope** — scope is determined by the **position of the code** in the source.

```js
function outer() {
  let name = "Lexical";
  function inner() {
    console.log(name); // ✅ Accesses parent scope
  }
  inner();
}
outer();
```

✅ Inner functions **remember** the outer scope — this forms a **closure**

---

## 📏 Scope Example Breakdown

```js
let a = 1;
function outer() {
  let b = 2;
  function inner() {
    let c = 3;
    console.log(a, b, c); // ✅ All accessible
  }
  inner();
  console.log(a, b); // ✅
  console.log(c);    // ❌
}
outer();
console.log(b);      // ❌
```

---

## 🧪 Temporal Dead Zone (TDZ)

> A `let` or `const` variable is in **TDZ** from the start of the block until it's declared.

```js
console.log(x); // ❌ ReferenceError (TDZ)
let x = 5;
```

✅ `var` is hoisted and initialized with `undefined`
❌ `let` and `const` are hoisted but NOT initialized

---

## 🚫 Hoisting Quick Recap

| Keyword               | Hoisted? | Initialized? | Scope Type        |
| --------------------- | -------- | ------------ | ----------------- |
| `var`                 | ✅ Yes    | ✅ undefined  | Function          |
| `let`                 | ✅ Yes    | ❌ TDZ        | Block             |
| `const`               | ✅ Yes    | ❌ TDZ        | Block             |
| Function Declarations | ✅ Fully  | ✅ Fully      | Function / Global |

---

## 🧠 Best Practices

✅ Prefer `let` and `const`
✅ Avoid `var` to prevent hoisting confusion
✅ Use block scope to limit variable lifetime
✅ Keep variables close to where they’re used

---

## 🔥 Rapid-Fire Interview Q\&A

✅ Difference between block scope and function scope?
✅ Why should we avoid `var` in modern JavaScript?
✅ What is lexical scope?
✅ What is a Temporal Dead Zone?
✅ What gets hoisted: `var`, `let`, `const`, functions?

---

## 🧪 Scope Debugging Tips

* Use browser dev tools to inspect scopes in breakpoints
* Watch for unintentional `var` usage
* Use strict mode (`'use strict';`) to catch silent errors
* Prefer smaller scopes → fewer bugs