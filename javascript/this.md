### ✅ 1. What is `this` in JavaScript?

> `this` refers to the **execution context** — i.e., the object that is currently executing the function.

```js
console.log(this); // In browser → window
```

---

### ✅ 2. What does `this` refer to in the global scope?

* In the **browser**, `this` in the global scope is the **`window` object**.
* In **Node.js**, it’s an **empty object (`{}`)** or **`global`** depending on module type.

```js
console.log(this); // browser → window, Node → {}
```

---

### ✅ 3. What is the value of `this` inside a regular function?

* **Non-strict mode** → global object (`window`)
* **Strict mode** → `undefined`

```js
function show() {
  console.log(this);
}

show(); // window (non-strict), undefined (strict)
```

---

### ✅ 4. What is the value of `this` inside a method in an object?

It refers to the object the method was **called on**.

```js
const user = {
  name: "Alice",
  greet() {
    console.log(this.name);
  }
};

user.greet(); // Alice
```

---

### ✅ 5. How does `this` behave inside a nested function?

Nested functions do **not inherit `this`** by default from outer functions.

```js
const obj = {
  name: "Bob",
  outer() {
    function inner() {
      console.log(this); // ❌ not `obj`, it's window or undefined
    }
    inner();
  }
};

obj.outer();
```

Fix it with:

* `const self = this;`
* Arrow function (lexical `this`)
* `bind(this)`

---

### ✅ 6. How does `this` work in a function called without an object?

It refers to the global object in non-strict mode, and `undefined` in strict mode.

```js
function test() {
  console.log(this);
}

test(); // window (non-strict), undefined (strict)
```

---

### ✅ 7. What is the difference in `this` between arrow functions and regular functions?

* **Regular functions**: `this` is dynamic and depends on how it's called.
* **Arrow functions**: `this` is **lexically bound** (inherited from the outer scope).

```js
const obj = {
  name: "Arrow",
  arrowFunc: () => {
    console.log(this.name); // ❌ `this` is global, not obj
  },
  normalFunc() {
    console.log(this.name); // ✅ `this` is obj
  }
};

obj.arrowFunc();
obj.normalFunc();
```

---

### ✅ 8. Does `this` in arrow functions refer to the object they are defined in?

❌ No. Objects are **not lexical scopes**. Arrow functions **capture `this`** from the enclosing function or global scope — not from the object.

---

### ✅ 9. What is lexical scoping of `this` in arrow functions?

Arrow functions don't bind their own `this`; instead, they inherit it from the **surrounding lexical scope**.

```js
function Outer() {
  const inner = () => {
    console.log(this); // refers to Outer’s `this`
  };
  inner();
}
new Outer(); // `this` is an instance of Outer
```

---

### ✅ 10. Why should arrow functions not be used as object methods if you rely on `this`?

Because `this` will not point to the object — it will point to the surrounding lexical scope (likely global or undefined).

---

### ✅ 11. What is the value of `this` inside a constructor function?

When used with `new`, `this` refers to the **new instance** created.

```js
function Person(name) {
  this.name = name;
}

const p = new Person("Alice");
console.log(p.name); // Alice
```

---

### ✅ 12. How does `this` behave inside class methods?

Inside class methods, `this` refers to the **instance of the class**.

```js
class User {
  constructor(name) {
    this.name = name;
  }
  greet() {
    console.log(this.name);
  }
}

const u = new User("Bob");
u.greet(); // Bob
```

---

### ✅ 13. What is the value of `this` inside an event handler?

In DOM event handlers:

* With **inline handlers**: `this` refers to the DOM element.
* In **addEventListener**: `this` refers to the element the listener is attached to.

```js
element.addEventListener("click", function () {
  console.log(this); // element
});
```

Arrow function version:

```js
element.addEventListener("click", () => {
  console.log(this); // ❌ not the element, uses lexical `this`
});
```

---

### ✅ 14. What happens to `this` when a method is passed as a callback?

`this` is **lost** if not bound.

```js
const obj = {
  name: "Charlie",
  sayHi() {
    console.log(this.name);
  }
};

setTimeout(obj.sayHi, 1000); // ❌ undefined
```

Fix:

```js
setTimeout(obj.sayHi.bind(obj), 1000); // ✅ Charlie
```

---

### ✅ 15. How does `this` behave in an inline event handler in the DOM?

```html
<button onclick="console.log(this)">Click me</button>
```

* Here, `this` refers to the **DOM element** (`<button>`).

### ✅ 16. What do `call()`, `apply()`, and `bind()` do to `this`?

They allow you to **manually set the value of `this`**.

```js
function say(greeting) {
  console.log(`${greeting}, ${this.name}`);
}

const user = { name: "Alice" };

say.call(user, "Hi");     // Hi, Alice
say.apply(user, ["Hello"]); // Hello, Alice
const boundFn = say.bind(user);
boundFn("Hey");           // Hey, Alice
```

---

### ✅ 17. What's the difference between `call`, `apply`, and `bind` in context of `this`?

| Method    | When It Runs       | Arguments                 |
| --------- | ------------------ | ------------------------- |
| `call()`  | Immediately        | Args passed individually  |
| `apply()` | Immediately        | Args passed as an array   |
| `bind()`  | Returns a function | Args passed like `call()` |

---

### ✅ 18. How would you ensure a method retains the correct `this` when passed as a callback?

Use `bind`, arrow function, or wrapper.

```js
const obj = {
  name: "Dev",
  greet() {
    console.log(this.name);
  }
};

setTimeout(obj.greet.bind(obj), 1000); // ✅ Dev
```

Or use arrow:

```js
setTimeout(() => obj.greet(), 1000);
```

---

### ✅ 19. How does `bind()` work internally?

It **returns a new function** with `this` permanently bound.

```js
function greet() {
  return this.name;
}

const bound = greet.bind({ name: "Bound" });
console.log(bound()); // Bound
```

---

### ✅ 20. Can you polyfill `Function.prototype.bind()`?

```js
Function.prototype.myBind = function(context, ...args) {
  const fn = this;
  return function(...innerArgs) {
    return fn.apply(context, [...args, ...innerArgs]);
  };
};
```

Usage:

```js
function sayName() {
  console.log(this.name);
}

const bound = sayName.myBind({ name: "Polyfill" });
bound(); // Polyfill
```

---

### ✅ 21. How does `this` behave inside a class constructor vs class method?

* **Constructor**: `this` refers to the new instance.
* **Method**: `this` refers to the calling instance.

```js
class Test {
  constructor(name) {
    this.name = name;
  }
  say() {
    console.log(this.name);
  }
}
```

---

### ✅ 22. What is the value of `this` in a static method of a class?

`this` refers to the **class itself**, not the instance.

```js
class Example {
  static show() {
    console.log(this); // class itself
  }
}

Example.show(); // logs Example class
```

---

### ✅ 23. What happens to `this` in React class component methods?

You need to **bind** the method in the constructor or use arrow functions to retain `this`.

```js
class App extends React.Component {
  constructor() {
    super();
    this.state = { count: 0 };
    this.handleClick = this.handleClick.bind(this); // ✅ bind here
  }

  handleClick() {
    console.log(this.state.count);
  }

  render() {
    return <button onClick={this.handleClick}>Click</button>;
  }
}
```

Or use class fields:

```js
handleClick = () => {
  console.log(this.state.count);
}
```

---

### ✅ 24. How does `this` behave in a chained method call like `obj.method().another()`?

It depends on what the method returns.

```js
const obj = {
  name: "A",
  method() {
    console.log(this.name);
    return this; // allows chaining
  },
  another() {
    console.log("Chained");
    return this;
  }
};

obj.method().another(); // A, Chained
```

---

### ✅ 25. How is `this` handled in async functions, promises, and generators?

`this` is **not preserved automatically** in async contexts.

```js
const obj = {
  name: "Async",
  async show() {
    setTimeout(function () {
      console.log(this.name); // ❌ undefined
    }, 1000);
  }
};

obj.show();

// Fix with arrow:
setTimeout(() => {
  console.log(this.name); // ✅ lexical `this`
}, 1000);
```

---

### ✅ 26. What is the value of `this` in a function assigned from one object to another?

`this` is determined by **how the function is called**, not where it was defined.

```js
const obj1 = {
  name: "One",
  show() {
    console.log(this.name);
  }
};

const obj2 = {
  name: "Two",
  show: obj1.show
};

obj2.show(); // Two
```

---

### ✅ 27. What is the value of `this` if you extract a method from an object and call it separately?

`this` will be **lost**.

```js
const obj = {
  name: "Lost",
  say() {
    console.log(this.name);
  }
};

const sayFn = obj.say;
sayFn(); // ❌ undefined
```

---

### ✅ 28. What does `this` refer to in a function invoked using `new`?

It refers to the newly created **instance**.

```js
function Person(name) {
  this.name = name;
}

const p = new Person("Alice");
console.log(p.name); // Alice
```

---

### ✅ 29. Why does `this` behave differently in strict mode?

Because in **strict mode**, `this` in a standalone function is `undefined` instead of `window`.

```js
"use strict";

function test() {
  console.log(this); // undefined
}

test();
```

---

### ✅ 30. What will `this` refer to in a function invoked using `.call(null)` or `.call(undefined)`?

* In **non-strict mode**: `this` becomes the **global object**
* In **strict mode**: `this` is exactly `null` or `undefined`

```js
function show() {
  console.log(this);
}

show.call(null); // non-strict: window, strict: null
```

---

### ✅ 31. Given a piece of code, explain what `this` refers to at each point.

```js
const obj = {
  name: "Test",
  greet() {
    console.log(this.name); // Test
    setTimeout(function () {
      console.log(this.name); // ❌ undefined
    }, 1000);
  }
};

obj.greet();
```

Fix:

```js
setTimeout(() => {
  console.log(this.name); // ✅ Test (lexical `this`)
}, 1000);
```

---

### ✅ 32. Fix a broken `this` reference in a callback or event handler.

```js
function Timer() {
  this.count = 0;
  setInterval(function () {
    this.count++; // ❌ `this` is window
  }, 1000);
}

// Fix:
setInterval(() => {
  this.count++; // ✅ lexical this
}, 1000);
```

---

### ✅ 33. Convert a regular function with incorrect `this` to an arrow function and explain why it fixes the issue.

```js
const obj = {
  count: 0,
  inc() {
    setTimeout(() => {
      this.count++;
    }, 1000);
  }
};
```

Arrow function captures `this` from `inc()`’s context.

---

### ✅ 34. Write a custom `bind` function that mimics native behavior.

(Already shared in Q20 — scroll up.)

---

### ✅ 35. Refactor a class or object method so it preserves the right `this` context when passed around.

```js
class Logger {
  constructor() {
    this.message = "Bound!";
    this.log = this.log.bind(this); // ✅ bind it
  }

  log() {
    console.log(this.message);
  }
}

const l = new Logger();
setTimeout(l.log, 1000); // ✅ Bound!
```