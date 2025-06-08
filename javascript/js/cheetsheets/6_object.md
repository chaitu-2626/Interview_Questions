# 🧾 JavaScript Objects + Methods Cheat Sheet

## 📦 What Is an Object?

> An object is a collection of **key-value pairs** (properties), where keys are strings or symbols, and values can be of any type.

```js
const user = {
  name: "Alice",
  age: 30,
  greet() { return "Hi!"; }
};
```

---

## 🔑 Accessing Properties

| Syntax       | Use Case                                    |
| ------------ | ------------------------------------------- |
| `obj.key`    | Dot notation (static key)                   |
| `obj["key"]` | Bracket notation (dynamic or special chars) |

---

## ✍️ Adding & Modifying Properties

```js
user.email = "alice@example.com";
user["isAdmin"] = true;
```

---

## ❌ Deleting Properties

```js
delete user.age;
```

---

## 🧪 Checking Properties

| Method                      | Description                                 |
| --------------------------- | ------------------------------------------- |
| `'key' in obj`              | Checks own or inherited property            |
| `obj.hasOwnProperty('key')` | Checks **own** property only                |
| `Object.hasOwn(obj, 'key')` | Safer ES2022+ alternative to hasOwnProperty |

---

## 🔄 Iterating Over Properties

```js
for (let key in user) {
  if (user.hasOwnProperty(key)) {
    console.log(key, user[key]);
  }
}

Object.keys(user);     // [ 'name', 'email', 'isAdmin' ]
Object.values(user);   // [ 'Alice', 'alice@example.com', true ]
Object.entries(user);  // [ ['name', 'Alice'], ['email', 'alice@example.com'], ['isAdmin', true] ]
```

---

## 🧰 Common Object Methods

| Method                                      | Description                                                 | Mutates?     |
| ------------------------------------------- | ----------------------------------------------------------- | ------------ |
| `Object.assign(target, ...sources)`         | Copies enumerable properties to target                      | Yes (target) |
| `Object.create(proto, props)`               | Creates a new object with prototype and optional properties | No           |
| `Object.freeze(obj)`                        | Makes object immutable (shallow)                            | No           |
| `Object.seal(obj)`                          | Prevents adding/removing properties but allows modification | No           |
| `Object.getOwnPropertyNames(obj)`           | Returns all own property names                              | No           |
| `Object.getOwnPropertyDescriptor(obj, key)` | Returns descriptor for property                             | No           |
| `Object.keys(obj)`                          | Returns array of own enumerable keys                        | No           |
| `Object.values(obj)`                        | Returns array of own enumerable values                      | No           |
| `Object.entries(obj)`                       | Returns array of own \[key, value] pairs                    | No           |
| `Object.fromEntries(entries)`               | Creates object from key-value pairs                         | No           |

---

## 🧩 Property Descriptors & Configurability

```js
const obj = {};
Object.defineProperty(obj, 'prop', {
  value: 42,
  writable: false,
  enumerable: true,
  configurable: false
});
```

* `writable`: can the value be changed?
* `enumerable`: appears in loops?
* `configurable`: can be deleted or reconfigured?

---

## 📦 Object Cloning / Merging

### Shallow Copy:

```js
const clone = Object.assign({}, user);
const clone2 = { ...user };
```

### Deep Copy (basic):

```js
const deepClone = JSON.parse(JSON.stringify(user));
```

> ⚠️ Doesn’t work with functions, `undefined`, symbols, circular refs!

---

## 🧪 Comparing Objects

```js
{} === {}        // false (reference comparison)
JSON.stringify(obj1) === JSON.stringify(obj2)  // shallow value check (works only for simple objects)
```

---

## 🔄 Object Destructuring

```js
const { name, email } = user;
const { age = 18 } = user;  // Default value
const { name: userName } = user;  // Rename variable
```

---

## 🔥 Common Interview Topics

* Difference between **own** and **inherited** properties
* `Object.freeze()` vs `Object.seal()`
* How to **clone** an object properly
* Property **enumerability and configurability**
* Use cases for **`Object.create()`** vs class inheritance

---

## 🔥 Rapid-Fire Quiz (Self-Test)

✅ How to check if a key exists only on the object, not in the prototype?

✅ What happens if you `freeze()` an object? Can nested objects be changed?

✅ How to list all enumerable keys of an object?

✅ What is the difference between `Object.assign()` and spread (`...`)?

✅ Can functions be properties in objects? How to call them?
