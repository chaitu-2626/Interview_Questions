# 🧾 JavaScript `this` Keyword Cheat Sheet

## 🤔 What is `this`?

> In JavaScript, `this` refers to the **object** that is executing the current function.

✅ Its value depends on **how the function is called**, not where it's written.

---

## 🧭 `this` in Different Contexts

| Context                        | What `this` Refers To                                 |
| ------------------------------ | ----------------------------------------------------- |
| Global (non-strict mode)       | Global object (`window` in browser, `global` in Node) |
| Global (strict mode)           | `undefined`                                           |
| Inside a method                | The object that owns the method                       |
| Alone in a function            | `undefined` (strict mode) or `window` (non-strict)    |
| Inside an arrow function       | Inherits `this` from the outer lexical scope          |
| In a class constructor         | The instance being created                            |
| In an event handler            | The DOM element that triggered the event              |
| In `setTimeout`, `setInterval` | Global object (or `undefined` in strict mode)         |

---

## 📦 Global Scope

```js
console.log(this); // 👉 window (in browser)
```

In strict mode:

```js
'use strict';
console.log(this); // 👉 undefined
```

---

## 👥 Inside an Object Method

```js
const user = {
  name: "Alice",
  greet() {
    console.log(this.name); // 👉 "Alice"
  }
};
user.greet();
```

---

## 🔄 Detached Function

```js
const greet = user.greet;
greet(); // ❌ this is undefined or window (depends on mode)
```

---

## 🏹 Arrow Functions and `this`

> Arrow functions do **not** have their own `this` — they **inherit** it from their lexical scope.

```js
const user = {
  name: "Bob",
  greet: () => {
    console.log(this.name); // ❌ undefined (inherits from outer scope)
  }
};
```

Correct version:

```js
const user = {
  name: "Bob",
  greet() {
    const arrow = () => console.log(this.name);
    arrow(); // 👉 "Bob"
  }
};
```

---

## 🧰 In Constructors

```js
function Person(name) {
  this.name = name;
}
const p = new Person("Charlie");
console.log(p.name); // 👉 "Charlie"
```

✅ `this` refers to the **newly created object**

---

## ⏱️ `this` in `setTimeout` / `setInterval`

```js
const obj = {
  count: 0,
  inc() {
    setTimeout(function () {
      console.log(this.count); // ❌ undefined or window.count
    }, 1000);
  }
};
```

✅ Use arrow function to fix:

```js
setTimeout(() => {
  console.log(this.count); // ✅ correct context
}, 1000);
```

---

## ⚙️ Manual Control: `call`, `apply`, `bind`

| Method    | Description                                                 |
| --------- | ----------------------------------------------------------- |
| `call()`  | Calls function with custom `this`, args passed individually |
| `apply()` | Same as `call`, but args as array                           |
| `bind()`  | Returns **new function** with bound `this`                  |

```js
function sayHello() {
  console.log(this.name);
}
const person = { name: "Dana" };

sayHello.call(person);  // 👉 "Dana"
sayHello.apply(person); // 👉 "Dana"

const boundFunc = sayHello.bind(person);
boundFunc(); // 👉 "Dana"
```

---

## 🧠 Interview Must-Know Concepts

✅ Difference between `this` in arrow vs regular function
✅ When is `this` undefined?
✅ How to fix incorrect `this` in callback?
✅ How does `bind()` differ from `call()`?
✅ How does `this` behave inside class methods?

---

## ⚠️ Common Mistakes

❌ Assuming arrow functions get their own `this`
❌ Using `this` in a detached function without binding
❌ Expecting `this` to refer to object when destructuring methods

```js
const { greet } = user;
greet(); // ❌ wrong this
```

✅ Fix using bind:

```js
const greet = user.greet.bind(user);
```

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ What does `this` refer to in an arrow function?
✅ Can you change `this` inside a method?
✅ What’s the difference between `call()` and `bind()`?
✅ What will `this` be in a function passed to `setTimeout()`?