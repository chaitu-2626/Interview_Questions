# 🧾 JavaScript Data Types Cheat Sheet

## 📦 JavaScript Has 2 Categories of Types

| Category                      | Examples                                                               | Stored As            |
| ----------------------------- | ---------------------------------------------------------------------- | -------------------- |
| **Primitive**                 | `string`, `number`, `boolean`, `null`, `undefined`, `bigint`, `symbol` | **Value**            |
| **Non-Primitive** (Reference) | `object`, `array`, `function`, `Date`, `RegExp`                        | **Reference (Heap)** |

---

## 1️⃣ Primitive Types (Immutable)

### 🔤 `string`

```js
let name = "Alice";
```

* Sequence of characters
* Immutable
* Template strings: `` `Hello ${name}` ``

---

### 🔢 `number`

```js
let count = 42;
let price = 99.99;
```

* Includes integers and floats
* Special values: `Infinity`, `-Infinity`, `NaN`

---

### 🔍 `boolean`

```js
let isReady = true;
```

* Only `true` or `false`
* Used in conditionals

---

### 🚫 `undefined`

```js
let x;
console.log(x); // undefined
```

* Variable declared but **not assigned**

---

### ❌ `null`

```js
let y = null;
```

* Explicit absence of value
* `typeof null` → `"object"` ❗ (legacy quirk)

---

### 🔑 `symbol` (ES6+)

```js
const sym = Symbol("id");
```

* Unique, immutable
* Useful as object property keys

---

### 🔢 `bigint` (ES2020+)

```js
const big = 1234567890123456789012345678901234567890n;
```

* Handles very large integers
* Cannot mix with regular numbers

---

## 2️⃣ Non-Primitive (Reference) Types

### 📦 `object`

```js
const user = { name: "Alice", age: 30 };
```

* Key-value pairs
* Can nest any type

---

### 📚 `array`

```js
const nums = [1, 2, 3];
```

* Ordered list (technically an object)
* Index-based access

---

### 🧠 `function`

```js
function greet() { return "Hi"; }
```

* First-class citizens (can be passed, returned, stored)
* Also an object under the hood

---

### 📆 `Date`, `/RegExp/`, `Map`, `Set`, etc.

* Built-in object types with special behavior

---

## 🧪 Type Detection Tools

| Method                             | Use Case                            |
| ---------------------------------- | ----------------------------------- |
| `typeof`                           | Primitive types (but beware quirks) |
| `Array.isArray()`                  | Check if array                      |
| `instanceof`                       | Object instance checks              |
| `Object.prototype.toString.call()` | Accurate fallback                   |

```js
typeof null        // "object" ❗
Array.isArray([])  // true
[] instanceof Array // true
```

---

## 🧠 Type Conversion (Coercion)

### 🔁 Implicit

```js
"5" + 1        // "51" (number → string)
"5" - 1        // 4   (string → number)
true + 1       // 2
null + 1       // 1
undefined + 1  // NaN
```

> ❗ **Interview classic:** Know how JS coerces types in different operations.

---

### 🔧 Explicit

```js
Number("5")     // 5
String(123)     // "123"
Boolean("")     // false
```

---

## 🎯 Pro Interview Tips

✅ Be ready to explain **why `typeof null` is "object"**

✅ Understand the **difference between primitive vs reference** types

✅ Know when and why **type coercion happens**

✅ Learn `==` vs `===` behavior in mixed-type comparisons

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ What’s the difference between `null` and `undefined`?

✅ What will `typeof NaN` return?

✅ How does JavaScript treat `[] + {}` and `{}` + \[]?

✅ Can functions be stored in variables?

✅ How can you safely check if a value is an array?
