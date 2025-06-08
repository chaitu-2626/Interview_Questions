# ✅ JavaScript Functions: Interview Q\&A Master Sheet

## 🔹 1. What is a function in JavaScript?

A function is a reusable block of code that performs a specific task.

```js
function greet(name) {
  return `Hello, ${name}`;
}

greet("Alice"); // "Hello, Alice"
```

JavaScript functions are **first-class citizens** — they can be assigned to variables, passed as arguments, or returned from other functions.

---

## 🔹 2. What are the different ways to declare a function?

### Function Declaration:

```js
function add(a, b) {
  return a + b;
}
```

### Function Expression:

```js
const add = function(a, b) {
  return a + b;
};
```

### Arrow Function:

```js
const add = (a, b) => a + b;
```

---

## 🔹 3. Function Declaration vs Function Expression vs Arrow Function

| Feature            | Declaration | Expression | Arrow Function |
| ------------------ | ----------- | ---------- | -------------- |
| Hoisted            | ✅ Yes       | ❌ No       | ❌ No           |
| Own `this`         | ✅ Yes       | ✅ Yes      | ❌ No (lexical) |
| Use as constructor | ✅ Yes       | ✅ Yes      | ❌ No           |
| Arguments object   | ✅ Yes       | ✅ Yes      | ❌ No           |

---

## 🔹 4. What is the difference between parameters and arguments?

* **Parameters** are variables listed in the function definition.
* **Arguments** are the actual values passed to the function.

```js
function greet(name) {  // ← parameter
  console.log("Hello", name);
}

greet("Bob"); // ← argument
```

---

## 🔹 5. What is the return value of a function that doesn’t explicitly return?

If no `return` is specified, the function returns `undefined`.

```js
function sayHi() {
  console.log("Hi");
}

const result = sayHi(); // undefined
```

---

## 🔹 6. How do you make a function return multiple values?

You can return an **array** or an **object**.

```js
// Array (ordered)
function getCoordinates() {
  return [10, 20];
}

const [x, y] = getCoordinates();

// Object (named)
function getUser() {
  return { name: "Alice", age: 25 };
}

const { name, age } = getUser();
```

---

## 🔹 7. What is the difference between function declaration and function expression?

| Feature      | Function Declaration | Function Expression        |
| ------------ | -------------------- | -------------------------- |
| Hoisting     | ✅ Yes                | ❌ No                       |
| When defined | Parse time           | Runtime                    |
| Syntax       | `function name() {}` | `const fn = function() {}` |

---

## 🔹 8. What is the difference between arrow functions and traditional functions?

| Feature     | Arrow Function     | Traditional Function      |
| ----------- | ------------------ | ------------------------- |
| `this`      | Lexically scoped   | Dynamic (depends on call) |
| `arguments` | ❌ Not available    | ✅ Available               |
| Constructor | ❌ Cannot use `new` | ✅ Can use `new`           |

```js
const arrow = () => console.log(this);
function normal() { console.log(this); }
```

---

## 🔹 9. What is hoisting in functions?

* **Function declarations** are hoisted (moved to the top of scope).
* **Function expressions** and **arrow functions** are **not** hoisted.

```js
sayHi(); // ✅ works
function sayHi() { console.log("Hi"); }

sayHello(); // ❌ error
const sayHello = function() { console.log("Hello"); };
```

---

## 🔹 10. What are higher-order functions?

Functions that:

* Accept other functions as arguments
* Or return a function

```js
function higherOrder(fn) {
  fn();
}

higherOrder(() => console.log("Called"));
```

---

## 🔹 11. What is a callback function?

A function passed into another function to be executed later.

```js
setTimeout(function() {
  console.log("Hello after 1 second");
}, 1000);
```

---

## 🔹 12. What is function currying?

Transforming a function with multiple arguments into a chain of functions.

```js
function multiply(a) {
  return function(b) {
    return a * b;
  };
}

const double = multiply(2);
console.log(double(5)); // 10
```

---

## 🔹 13. What is an IIFE (Immediately Invoked Function Expression)?

```js
(function() {
  console.log("IIFE runs immediately");
})();
```

Used to:

* Avoid polluting global scope
* Create private scopes

---

## 🔹 14. What is a pure function?

A function that:

* Has no side effects
* Returns the same output for the same input

```js
function add(a, b) {
  return a + b;
}
```

---

## 🔹 15. What are closures?

A function that remembers the variables from its outer scope even after the outer function has finished executing.

```js
function outer() {
  let count = 0;
  return function() {
    count++;
    return count;
  };
}

const counter = outer();
console.log(counter()); // 1
console.log(counter()); // 2
```

---

## 🔹 16. What is the difference between `call`, `apply`, and `bind`?

```js
function greet(greeting) {
  console.log(`${greeting}, ${this.name}`);
}

const person = { name: "Alice" };

greet.call(person, "Hi");     // Hi, Alice
greet.apply(person, ["Hey"]); // Hey, Alice
const bound = greet.bind(person);
bound("Hello");               // Hello, Alice
```

---

## 🔹 17. What are rest parameters and the arguments object?

```js
function sum(...args) {
  return args.reduce((a, b) => a + b, 0);
}

sum(1, 2, 3); // 6
```

* `...args` collects all arguments.
* `arguments` is array-like (not a real array), not available in arrow functions.

---

## 🔹 18. What is function composition?

Combining multiple functions where output of one becomes input of the next.

```js
const double = x => x * 2;
const square = x => x * x;

const composed = x => square(double(x));
console.log(composed(5)); // 100
```

---

## 🔹 19. What is memoization?

Caching results of function calls for performance.

```js
function memoize(fn) {
  const cache = {};
  return function(n) {
    if (cache[n]) return cache[n];
    cache[n] = fn(n);
    return cache[n];
  };
}

const slowSquare = n => n * n;
const fastSquare = memoize(slowSquare);
```

---

## 🔹 20. Can you write a `once()` function that runs only once?

```js
function once(fn) {
  let called = false;
  let result;
  return function(...args) {
    if (!called) {
      result = fn.apply(this, args);
      called = true;
    }
    return result;
  };
}

const logOnce = once(() => console.log("Called once!"));
logOnce(); // Called once!
logOnce(); // (nothing)
```

---

## 🔹 21. What are generator functions?

Functions that can pause and resume execution using `yield`.

```js
function* gen() {
  yield 1;
  yield 2;
  yield 3;
}

const g = gen();
console.log(g.next().value); // 1
console.log(g.next().value); // 2
```

---

## 🔹 22. What is async/await in functions?

Used to handle promises in a cleaner way.

```js
async function fetchData() {
  const res = await fetch("https://api.example.com/data");
  const data = await res.json();
  return data;
}
```

---

## 🔹 23. What is the difference between synchronous and asynchronous functions?

* **Synchronous**: Blocks execution until finished.
* **Asynchronous**: Allows other tasks to run in the background using callbacks, promises, async/await.

---

## 🔹 24. What is the role of the event loop in function execution?

* Functions go to the **call stack**.
* Async callbacks go to **callback queue** and wait for the stack to be empty.

---

## 🔹 25. What are default parameters?

Default parameters allow named parameters to be initialized with default values if no value or `undefined` is passed.

```js
function greet(name = "Guest") {
  return `Hello, ${name}!`;
}

console.log(greet("Alice")); // Hello, Alice!
console.log(greet());        // Hello, Guest!
```

---

## 🔹 26. What is recursion in functions?

Recursion is a programming technique where a function calls itself to solve a problem. It's often used for problems that can be broken down into smaller, self-similar subproblems.

```js
function factorial(n) {
  if (n === 0 || n === 1) {
    return 1; // Base case
  }
  return n * factorial(n - 1); // Recursive call
}

console.log(factorial(5)); // 120 (5 * 4 * 3 * 2 * 1)
```

---

## 🔹 27. How do you use functions as constructors with the `new` keyword?

A constructor function is a regular function that is used to create new objects. When called with the `new` keyword, it creates a new object, sets `this` to that object, executes the function, and returns the new object.

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

Person.prototype.greet = function() {
  console.log(`Hi, my name is ${this.name} and I am ${this.age} years old.`);
};

const alice = new Person("Alice", 30);
alice.greet(); // Hi, my name is Alice and I am 30 years old.
```

---

## 🔹 28. What is destructuring in function parameters?

Destructuring allows you to unpack values from arrays or properties from objects into distinct variables. This can be used directly in function parameters for cleaner code.

```js
// Object destructuring
function displayUser({ name, age }) {
  console.log(`Name: ${name}, Age: ${age}`);
}

const user = { name: "Bob", age: 28 };
displayUser(user); // Name: Bob, Age: 28

// Array destructuring
function printCoordinates([x, y]) {
  console.log(`X: ${x}, Y: ${y}`);
}

const coords = [10, 20];
printCoordinates(coords); // X: 10, Y: 20
```