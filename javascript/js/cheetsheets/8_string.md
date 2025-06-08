# 🧾 JavaScript Strings + Methods Cheat Sheet

## 📦 What Is a String?

> A string is a **sequence of characters** used to represent text. Strings are **immutable** in JavaScript.

```js
const greeting = "Hello, World!";
```

---

## 🔧 Creating Strings

```js
const s1 = "Hello";        // double quotes
const s2 = 'World';        // single quotes
const s3 = `Template ${s1}`;  // backticks (template literals)
```

---

## 📏 String Properties

```js
str.length    // length of string
```

---

## 🧰 Common String Methods

| Method                        | Description                                      | Example                        | Output               |
| ----------------------------- | ------------------------------------------------ | ------------------------------ | -------------------- |
| `charAt(index)`               | Returns char at `index`                          | `"abc".charAt(1)`              | `"b"`                |
| `charCodeAt(index)`           | Returns Unicode code of char                     | `"abc".charCodeAt(0)`          | `97`                 |
| `concat()`                    | Concatenates strings                             | `"a".concat("b")`              | `"ab"`               |
| `includes(substring)`         | Checks if substring exists                       | `"hello".includes("ll")`       | `true`               |
| `indexOf(substring)`          | Returns first index of substring or -1           | `"hello".indexOf("l")`         | `2`                  |
| `lastIndexOf(substring)`      | Returns last index of substring or -1            | `"hello".lastIndexOf("l")`     | `3`                  |
| `slice(start, end)`           | Extracts substring from `start` to `end-1`       | `"hello".slice(1, 4)`          | `"ell"`              |
| `substring(start, end)`       | Similar to slice but no negative indexes         | `"hello".substring(1, 4)`      | `"ell"`              |
| `substr(start, length)`       | Extract substring from `start` with given length | `"hello".substr(1, 3)`         | `"ell"`              |
| `toLowerCase()`               | Converts to lowercase                            | `"HELLO".toLowerCase()`        | `"hello"`            |
| `toUpperCase()`               | Converts to uppercase                            | `"hello".toUpperCase()`        | `"HELLO"`            |
| `trim()`                      | Removes whitespace from both ends                | `"  hi  ".trim()`              | `"hi"`               |
| `split(separator)`            | Splits string into array                         | `"a,b,c".split(",")`           | `["a", "b", "c"]`    |
| `repeat(n)`                   | Repeats string `n` times                         | `"ha".repeat(3)`               | `"hahaha"`           |
| `startsWith(substring)`       | Checks if string starts with substring           | `"hello".startsWith("he")`     | `true`               |
| `endsWith(substring)`         | Checks if string ends with substring             | `"hello".endsWith("lo")`       | `true`               |
| `replace(search, replace)`    | Replace first occurrence                         | `"hello".replace("l", "L")`    | `"heLlo"`            |
| `replaceAll(search, replace)` | Replace all occurrences (ES2021+)                | `"hello".replaceAll("l", "L")` | `"heLLo"`            |
| `localeCompare(otherString)`  | Compare strings lexicographically                | `"a".localeCompare("b")`       | `-1` (means `a < b`) |

---

## 🔥 Template Literals (ES6+)

```js
const name = "Alice";
const greeting = `Hello, ${name}!`;  // Template strings support expressions & multiline
```

---

## 🧠 Important String Behaviors

* Strings are **immutable** — methods return new strings, original is unchanged.
* Access via bracket notation: `"hello"[1] === "e"`
* Negative indices are **not supported** in `slice` but `substring` treats negatives as 0.
* `substr()` is **deprecated**, avoid using it.

---

## 🧰 Useful Patterns

### Reverse String

```js
const reversed = str.split("").reverse().join("");
```

### Check Palindrome

```js
const isPalindrome = str => {
  const s = str.toLowerCase().replace(/\W/g, "");
  return s === s.split("").reverse().join("");
};
```

### Count Substring Occurrences

```js
const countOccurrences = (str, sub) => 
  str.split(sub).length - 1;
```

---

## 🔥 Common Interview Pitfalls

❗ `indexOf` returns -1 when not found — always check!

❗ `replace()` replaces only first occurrence; use `replaceAll()` or regex for global replace

❗ Template literals support **multiline strings** without special chars

❗ Beware of Unicode surrogate pairs in `charAt` / `charCodeAt`

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ How to get the length of a string?

✅ How to convert a string to uppercase?

✅ How to split a string into words?

✅ How to check if a string contains a substring?

✅ How to safely compare strings lexicographically?