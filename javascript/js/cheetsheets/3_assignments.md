# 🧾 JavaScript Assignment Operators Cheat Sheet

## 🔄 What Is Assignment?

> Assignment is the act of **storing a value** in a variable using the `=` operator or its shorthand forms.

---

## 🧰 Basic Assignment Operator

```js
let a = 10;
const name = "Alice";
```

> ✅ `=` stores the right-hand value into the left-hand variable.

---

## 🔁 Compound Assignment Operators

| Operator | Description         | Equivalent to          |
| -------- | ------------------- | ---------------------- |
| `+=`     | Add and assign      | `x += y` → `x = x + y` |
| `-=`     | Subtract and assign | `x -= y`               |
| `*=`     | Multiply and assign | `x *= y`               |
| `/=`     | Divide and assign   | `x /= y`               |
| `%=`     | Modulus and assign  | `x %= y`               |
| `**=`    | Exponent and assign | `x **= y`              |

```js
let x = 5;
x += 3;  // 8
x *= 2;  // 16
```

---

## 🧠 Destructuring Assignment

> Quickly extract values from arrays or objects into variables.

### 📦 Array Destructuring

```js
const arr = [1, 2, 3];
const [a, b] = arr;     // a = 1, b = 2
```

* ✅ Skip values:

  ```js
  const [, , c] = arr; // c = 3
  ```

* ✅ Use rest:

  ```js
  const [x, ...rest] = [1, 2, 3, 4]; // x = 1, rest = [2, 3, 4]
  ```

---

### 🗃️ Object Destructuring

```js
const user = { name: "Bob", age: 25 };
const { name, age } = user;
```

* ✅ Rename while destructuring:

  ```js
  const { name: userName } = user;
  ```

* ✅ Use default values:

  ```js
  const { email = "N/A" } = user;
  ```

---

## 🔁 Chained Assignments

```js
let a, b, c;
a = b = c = 5;
```

> ⚠️ All variables will reference the same assigned value, but avoid for clarity.

---

## 🧠 Logical Assignment Operators (ES2021+)

> Combine logical checks with assignment in one step.

| Operator | Description                             |     |                         |
| -------- | --------------------------------------- | --- | ----------------------- |
| \`       |                                         | =\` | Assign if left is falsy |
| `&&=`    | Assign if left is truthy                |     |                         |
| `??=`    | Assign if left is `null` or `undefined` |     |                         |

```js
let name = "";
name ||= "Guest";  // name = "Guest" (because "" is falsy)

let isAdmin = true;
isAdmin &&= false; // isAdmin = false

let userColor = null;
userColor ??= "blue"; // "blue"
```

> 🧠 These are **great for default assignments** and config loading.

---

## 🧪 Assignment in Expressions

```js
let result;
if (result = true) {
  console.log("Will run!");  // ⚠️ Assigns, not compares
}
```

> ❗ **Common bug**: `=` used instead of `==`/`===`
> ✅ Use parentheses **only when intended** to assign inside expressions.

---

## 🧠 Pro Interview Tips

✅ Be fluent with **destructuring** — it's a *must-know* for real-world JS

✅ Understand **logical assignments (`||=`, `??=`)** and how they differ from short-circuiting

✅ Know **default values** in destructuring and how renaming works

✅ Don't confuse **`=` assignment** with **`==` / `===` comparison**

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ What’s the difference between `||=` and `??=`?

✅ How do you assign a default value while destructuring an object?

✅ What’s wrong with `if (x = 10)`?

✅ Can you rename variables during object destructuring?

