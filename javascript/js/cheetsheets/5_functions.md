# 🧾 JavaScript Functions Cheat Sheet

## 🧠 What Is a Function?

> A function is a **block of reusable code** designed to perform a task.
> Functions in JS are **first-class citizens** — meaning they can be stored in variables, passed, and returned.

---

## 🧰 Function Types in JavaScript

| Type                                    | Syntax Example                | Description                             |
| --------------------------------------- | ----------------------------- | --------------------------------------- |
| **Function Declaration**                | `function greet() {}`         | Hoisted, named                          |
| **Function Expression**                 | `const greet = function() {}` | Not hoisted, anonymous (or named)       |
| **Arrow Function**                      | `const greet = () => {}`      | Concise, lexical `this`, no `arguments` |
| **Constructor Function**                | `function Person() {}`        | Used with `new` to create objects       |
| **Immediately Invoked Function (IIFE)** | `(function() {})()`           | Self-executing, isolates scope          |

---

### 📦 Function Declaration

```js
function sayHi() {
  return "Hi!";
}
```

✅ Hoisted
✅ Good for defining utility functions early

---

### 🧱 Function Expression

```js
const sayBye = function() {
  return "Bye!";
};
```

❌ Not hoisted
✅ Useful for conditional logic or passing functions

---

### ⚡ Arrow Function

```js
const add = (a, b) => a + b;
```

✅ Shorter syntax
✅ Lexical `this` (inherits from outer scope)
❌ No `arguments`, `new`, or `this` binding

---

### 🧪 Immediately Invoked Function Expression (IIFE)

```js
(function() {
  console.log("Runs immediately!");
})();
```

✅ Runs on definition
✅ Common in modules, scope isolation

---

## 🧠 Parameters vs Arguments

```js
function greet(name) {  // parameter
  return `Hello, ${name}`;
}

greet("Alice");         // argument
```

---

## 🔁 Default Parameters (ES6+)

```js
function greet(name = "Guest") {
  return `Hello, ${name}`;
}
```

✅ Helps avoid `undefined`
✅ Can use expressions as default

---

## 🧰 Rest Parameters

```js
function sum(...nums) {
  return nums.reduce((a, b) => a + b, 0);
}
```

✅ Collects all remaining arguments
✅ Always goes **last**

---

## 🧪 Arguments Object

```js
function showArgs() {
  console.log(arguments);
}
```

✅ Available in **regular functions**
❌ Not available in arrow functions

> ⚠️ Use `rest` syntax instead for modern code

---

## 💥 Function Hoisting

```js
sayHello(); // ✅ Works
function sayHello() {
  console.log("Hi");
}
```

```js
sayBye(); // ❌ Error
const sayBye = function() {
  console.log("Bye");
};
```

> ✅ Declarations hoisted
> ❌ Expressions are not

---

## 🧩 Closures (Advanced Interview Topic)

```js
function outer() {
  let count = 0;
  return function inner() {
    return ++count;
  };
}

const counter = outer();
counter(); // 1
counter(); // 2
```

✅ Inner function "remembers" outer scope
✅ Used in data privacy, factories, event handlers

---

## 🔀 Function as First-Class Citizen

```js
function log(fn) {
  console.log(fn());
}

log(() => "Hi");  // ✅ Passing a function as a value
```

✅ Can be stored, passed, returned
✅ Enables higher-order functions & callbacks

---

## 🧠 Pro Interview Tips

✅ Know how **arrow functions differ** from regular ones (`this`, `arguments`, etc.)

✅ Be ready to explain **hoisting differences**

✅ Closures are **interview gold** — practice use cases

✅ Be able to write and identify **pure functions**

✅ Use **default and rest parameters** cleanly

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ What’s the difference between a function declaration and expression?

✅ How does `this` behave in arrow functions vs regular functions?

✅ Can you use `arguments` in arrow functions?

✅ What is a closure and when would you use it?

✅ What happens when you return a function from another?