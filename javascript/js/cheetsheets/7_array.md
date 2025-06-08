# 🧾 JavaScript Arrays + Methods Cheat Sheet

## 📦 What Is an Array?

> Arrays are **ordered collections** of elements (any data type) stored in **zero-based index** format.

```js
const fruits = ["apple", "banana", "cherry"];
```

✅ Arrays are **mutable**

✅ Arrays are **objects** under the hood

✅ Supports heterogeneous types: `[1, "two", { three: 3 }]`

---

## 🔧 Creating Arrays

```js
const a = [1, 2, 3];                    // Literal
const b = new Array(3);                // [ <3 empty items> ]
const c = Array.of(1, 2, 3);           // [1, 2, 3]
const d = Array.from("hello");         // ['h','e','l','l','o']
```

---

## 📏 Array Properties

```js
arr.length     // Total number of elements
```

✅ `.length` is mutable:

```js
arr.length = 2;  // Truncates array
```

---

## 📚 Array Iteration Methods

| Method        | Description                              |
| ------------- | ---------------------------------------- |
| `forEach()`   | Executes callback for each element       |
| `map()`       | Returns a new array of transformed items |
| `filter()`    | Returns array of items that pass test    |
| `reduce()`    | Reduces array to a single value          |
| `some()`      | Returns `true` if **any** item passes    |
| `every()`     | Returns `true` if **all** items pass     |
| `find()`      | First matching element                   |
| `findIndex()` | Index of first matching element          |

### 🔁 Example

```js
const nums = [1, 2, 3, 4];

// map
nums.map(x => x * 2);        // [2, 4, 6, 8]

// filter
nums.filter(x => x % 2 === 0); // [2, 4]

// reduce
nums.reduce((acc, cur) => acc + cur, 0); // 10
```

---

## 🧰 Add / Remove Elements

| Method      | Description                         |
| ----------- | ----------------------------------- |
| `push()`    | Add to end                          |
| `pop()`     | Remove from end                     |
| `unshift()` | Add to start                        |
| `shift()`   | Remove from start                   |
| `splice()`  | Add/remove at specific index        |
| `slice()`   | Returns shallow copy (non-mutating) |

```js
let arr = [1, 2, 3];
arr.push(4);       // [1, 2, 3, 4]
arr.pop();         // [1, 2, 3]
arr.splice(1, 1);  // [1, 3]
arr.slice(1, 3);   // [2, 3] (non-mutating)
```

---

## 🧪 Searching in Arrays

| Method          | Description                         |
| --------------- | ----------------------------------- |
| `includes()`    | Checks if value exists              |
| `indexOf()`     | Index of value (or -1)              |
| `lastIndexOf()` | Last index of value                 |
| `find()`        | First element matching condition    |
| `findIndex()`   | Index of element matching condition |

```js
[1, 2, 3].includes(2);      // true
[1, 2, 3].indexOf(3);       // 2
[5, 10, 15].find(x => x > 9); // 10
```

---

## 🔄 Sorting & Reversing

```js
let arr = [3, 1, 2];
arr.sort();              // [1, 2, 3] (as strings!)
arr.sort((a, b) => a - b); // ✅ correct numeric sort
arr.reverse();           // Reverse in-place
```

---

## 🔗 Combining & Flattening

| Method      | Description                    |
| ----------- | ------------------------------ |
| `concat()`  | Combines arrays (non-mutating) |
| `flat()`    | Flattens nested arrays         |
| `flatMap()` | Map + flat (1 level)           |
| `join()`    | Combines elements into string  |

```js
[1, 2].concat([3, 4]);           // [1, 2, 3, 4]
[[1], [2], [3]].flat();          // [1, 2, 3]
["a", "b"].join("-");            // "a-b"
```

---

## 🆕 ES6+ Features

### 🔁 Spread Operator

```js
[...arr1, ...arr2];
```

### 📥 Destructuring

```js
const [first, ...rest] = [1, 2, 3];
```

### 🧩 `Array.from()` (convert & map)

```js
Array.from("abc", char => char.toUpperCase()); // ['A','B','C']
```

---

## 🧠 Common Interview Pitfalls

❗ `sort()` compares as **strings** unless you pass a comparator
❗ `splice()` mutates, `slice()` doesn't
❗ Comparing arrays:

```js
[1,2] === [1,2] // false (reference!)
```

✅ To deep compare: use `JSON.stringify(a) === JSON.stringify(b)` (for simple cases)

---

## 📚 Performance & Tips

✅ Prefer `.map()`, `.filter()`, and `.reduce()` over manual `for` loops for readability

✅ Use `for...of` or `forEach` for side-effects (not returning a value)

✅ Avoid `.map()` if you’re not using the returned array

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ Difference between `slice()` and `splice()`?

✅ How do you flatten `[1, [2, [3]]]`?

✅ What does `reduce()` do?

✅ Can you chain `filter().map().reduce()`?

✅ How to remove duplicates from an array?

---

## ✨ Bonus: Remove Duplicates

```js
[...new Set([1, 2, 2, 3])];  // [1, 2, 3]
```