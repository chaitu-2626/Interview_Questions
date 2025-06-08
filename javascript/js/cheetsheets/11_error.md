# 🧾 JavaScript Errors Cheat Sheet

---

## ❗ What is an Error?

> An error in JavaScript is an **exception** that occurs during code execution, interrupting normal flow.

There are two main types:

1. **Synchronous errors** (try/catch)
2. **Asynchronous errors** (Promise rejection, async/await)

---

## 🔍 Built-in Error Types

| Error Type       | When it Happens                       | Example                              |
| ---------------- | ------------------------------------- | ------------------------------------ |
| `Error`          | Base error class                      | `throw new Error("Something broke")` |
| `TypeError`      | Invalid type operation                | `null.f()`                           |
| `ReferenceError` | Accessing undeclared variable         | `console.log(x)` (x is not defined)  |
| `SyntaxError`    | Code can't be parsed                  | `if (true {}`                        |
| `RangeError`     | Value out of allowed range            | `[].length = -1`                     |
| `EvalError`      | Rare, error in global `eval()` usage  | `eval("invalid code")`               |
| `URIError`       | Bad URI functions usage               | `decodeURIComponent('%')`            |
| `AggregateError` | Multiple errors (e.g., `Promise.any`) | `throw new AggregateError([...])`    |

---

## 🧰 Creating and Throwing Errors

```js
throw new Error("Something went wrong");
throw new TypeError("Expected a number");
```

> `Error` constructor syntax:

```js
new Error(message, { cause });
```

---

## 🛡️ Error Handling with `try...catch`

```js
try {
  // code that may throw
  riskyFunction();
} catch (err) {
  console.error("Caught:", err.message);
}
```

✅ `catch` captures **only runtime errors**
✅ Access error with `err.name`, `err.message`, `err.stack`

---

## 📦 Optional `finally`

```js
try {
  // risky code
} catch (e) {
  // handle error
} finally {
  // always runs
}
```

---

## 🔄 Rethrow an Error

```js
try {
  throw new Error("Inner fail");
} catch (e) {
  console.log("Logging:", e.message);
  throw e; // pass error up
}
```

---

## ⏱️ Async Error Handling

### Using Promises

```js
fetch('/bad-url')
  .then(res => res.json())
  .catch(err => console.error("Async error:", err));
```

### Using `async/await` + try/catch

```js
async function getData() {
  try {
    const res = await fetch('/bad-url');
    const data = await res.json();
  } catch (err) {
    console.error("Async caught:", err.message);
  }
}
```

---

## 🎯 Custom Error Classes

```js
class CustomError extends Error {
  constructor(message) {
    super(message);
    this.name = "CustomError";
  }
}
throw new CustomError("Something custom went wrong");
```

✅ Use for domain-specific or layered error logic.

---

## 🧠 Best Practices

✅ Always use `try...catch` around risky code

✅ Never silently ignore errors (`catch (e) {}` with no body)

✅ Log meaningful error info: `err.message`, `err.stack`

✅ Use **custom error classes** in larger codebases

✅ Use `finally` to release resources (e.g., close DB)

---

## 🔥 Rapid-Fire Interview Q\&A

✅ What’s the difference between `TypeError` and `ReferenceError`?

✅ How do you handle errors in `async/await`?

✅ What does the `finally` block do?

✅ How do you create custom error types?

✅ Can `try...catch` catch `SyntaxError`?

---

## 🧪 Quick Quiz

1. How do you catch an error from a failed `JSON.parse()`?
2. What's the difference between `throw` and `return` inside a `catch`?
3. What happens if you `throw` inside a `catch` block?