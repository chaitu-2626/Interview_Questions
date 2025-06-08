# 🧾 JavaScript Operators Cheat Sheet

## 🔢 Types of Operators

| Type              | Example                 | Purpose                                 |                             |                                       |
| ----------------- | ----------------------- | --------------------------------------- | --------------------------- | ------------------------------------- |
| Arithmetic        | `+`, `-`, `*`, `/`, `%` | Basic math operations                   |                             |                                       |
| Assignment        | `=`, `+=`, `*=`, `**=`  | Assign or update values                 |                             |                                       |
| Comparison        | `==`, `===`, `>`, `<`   | Compare values                          |                             |                                       |
| Logical           | `&&`, \`                |                                         | `, `!\`                     | Combine or negate boolean expressions |
| Bitwise           | `&`, \`                 | `, `^`, `\~\`                           | Low-level binary operations |                                       |
| Ternary           | `cond ? val1 : val2`    | Inline conditional                      |                             |                                       |
| Type              | `typeof`, `instanceof`  | Check types                             |                             |                                       |
| Nullish           | `??`                    | Fallback when `null` or `undefined`     |                             |                                       |
| Optional Chaining | `?.`                    | Safe access to deeply nested properties |                             |                                       |
| Spread/Rest       | `...`                   | Expand or collect elements              |                             |                                       |

---

## ➕ Arithmetic Operators

```js
let a = 10, b = 3;
a + b     // 13
a - b     // 7
a * b     // 30
a / b     // 3.33
a % b     // 1
a ** b    // 1000
```

---

## 🎯 Assignment Operators

```js
let x = 5;
x += 2;   // x = x + 2 → 7
x *= 3;   // x = x * 3 → 21
```

> 🧠 Useful for in-place updates during loops or calculations

---

## 🧪 Comparison Operators

```js
5 == '5'      // true  (loose equality)
5 === '5'     // false (strict equality)
5 != '5'      // false
5 !== '5'     // true
3 > 2         // true
```

> ✅ Use `===` and `!==` to avoid type coercion bugs

---

## 🔐 Logical Operators

```js
true && false     // false
true || false     // true
!true             // false
```

> 🧠 Can be used for **short-circuiting**

```js
let name = input || 'Guest';    // if input is falsy → 'Guest'
```

---

## ❓ Ternary Operator

```js
let age = 20;
let canVote = age >= 18 ? "Yes" : "No";
```

> ✅ Great for simple conditions inline

---

## 🔍 Type Operators

```js
typeof 123         // 'number'
typeof null        // 'object' ❗ (known JS quirk)
'hello' instanceof String   // false
new String('hi') instanceof String // true
```

---

## 🧯 Nullish Coalescing (`??`)

```js
let userColor = null;
let defaultColor = "blue";
let color = userColor ?? defaultColor;   // "blue"
```

> ✅ Unlike `||`, `??` only checks for `null` or `undefined` — **not all falsy values**

---

## ❓ Optional Chaining (`?.`)

```js
let user = {};
let city = user?.address?.city;  // undefined, no error
```

> ✅ Prevents “Cannot read property of undefined” errors

---

## 🔁 Spread / Rest Operators

```js
// Spread
let nums = [1, 2, 3];
let copy = [...nums];    // [1, 2, 3]

// Rest
function sum(...args) {
  return args.reduce((a, b) => a + b, 0);
}
```

---

## ⚙️ Bitwise Operators (Low-Level)

| Operator | Meaning     | Example       |     |         |
| -------- | ----------- | ------------- | --- | ------- |
| `&`      | AND         | `5 & 1 → 1`   |     |         |
| \`       | \`          | OR            | \`5 | 1 → 5\` |
| `^`      | XOR         | `5 ^ 1 → 4`   |     |         |
| `~`      | NOT         | `~5 → -6`     |     |         |
| `<<`     | Left shift  | `5 << 1 → 10` |     |         |
| `>>`     | Right shift | `5 >> 1 → 2`  |     |         |

> ⚠️ Mostly used in performance-heavy or bitmasking scenarios

---

## 🧠 Pro Interview Tips

✅ **Always** prefer `===` over `==` unless you *intentionally* want coercion

✅ Know the difference between `||` and `??`

✅ Be ready to explain **short-circuiting** in real-world examples

✅ Interviewers love asking about **optional chaining** and **nullish coalescing** in modern codebases

✅ Practice combining ternary, logical, and type checks together

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ What’s the difference between `==` and `===`?

✅ When should you use `??` instead of `||`?

✅ Can you chain multiple ternary operations?

✅ What happens if you use optional chaining on a non-existent property?