# 💤 Lazy Loading Cheat Sheet

> Load content **only when needed**, reducing initial load time and saving bandwidth.

---

## 🧠 Why Use Lazy Loading?

| ✅ Benefit               | 🚀 Result                       |
| ----------------------- | ------------------------------- |
| Load less on first view | Faster page load                |
| Save bandwidth          | Especially helpful on mobile    |
| Improve UX              | Smooth experience, less waiting |
| Optimize SEO & metrics  | Better Lighthouse scores        |

---

## 🔧 Common Use Cases

| Use Case        | What to Lazy Load                    |
| --------------- | ------------------------------------ |
| 🖼️ Images      | Product photos, blog thumbnails      |
| 🎞️ Videos      | Embedded YouTube, autoplay videos    |
| 🧩 Components   | React/Vue/Angular modules            |
| 📜 Pages/Routes | In Single Page Applications (SPA)    |
| 📊 Data         | Graphs, tables, API-heavy components |

---

## 💡 Lazy Load HTML Images (Native Way)

### ✅ Basic Image Lazy Load

```html
<img src="image.jpg" loading="lazy" alt="..." />
```

* Works in most modern browsers
* Automatically defers loading until image is visible

---

## ⚛️ Lazy Load in React

### 🔄 Lazy Load Component

```jsx
import React, { lazy, Suspense } from 'react';

const LazyComponent = lazy(() => import('./MyComponent'));

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <LazyComponent />
    </Suspense>
  );
}
```

---

## 📦 Lazy Load in Vue

### Vue 3 (Dynamic Component Import)

```vue
<script setup>
const LazyComp = defineAsyncComponent(() => import('./HeavyComponent.vue'))
</script>

<template>
  <Suspense>
    <template #default>
      <LazyComp />
    </template>
    <template #fallback>
      Loading...
    </template>
  </Suspense>
</template>
```

---

## 🧭 Lazy Load Routes (React Router Example)

```jsx
import { lazy } from 'react';
const About = lazy(() => import('./pages/About'));

<Route path="/about" element={
  <Suspense fallback={<div>Loading...</div>}>
    <About />
  </Suspense>
} />
```

---

## 🎞️ Lazy Load YouTube Videos (With Thumbnail Placeholder)

```html
<iframe
  loading="lazy"
  src="https://www.youtube.com/embed/abc123"
  width="560" height="315"
  frameborder="0" allowfullscreen
></iframe>
```

Use a `poster` thumbnail or replace iframe with an image and load on click.

---

## 🪝 Lazy Load on Scroll (JS Intersection Observer)

```html
<img data-src="heavy.jpg" class="lazy-img" />
```

```js
const lazyImages = document.querySelectorAll('.lazy-img');

const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target;
      img.src = img.dataset.src;
      observer.unobserve(img);
    }
  });
});

lazyImages.forEach(img => observer.observe(img));
```

✅ Full control

✅ Works for any content (images, sections, etc.)

---

## 🌍 Tools & Libraries

| Tool / Library                                    | Use Case                           |
| ------------------------------------------------- | ---------------------------------- |
| [Lazysizes](https://github.com/aFarkas/lazysizes) | Best lazy loader for images        |
| `React.lazy`                                      | Lazy load components in React      |
| `vue-lazyload`                                    | Lazy load images/components in Vue |
| `React Loadable`                                  | Code-splitting + SSR               |

---

## 🔍 Best Practices

| ✅ Do                                     | ❌ Don’t                                       |
| ---------------------------------------- | --------------------------------------------- |
| Use `loading="lazy"` for images/videos   | Lazy load critical content (like hero banner) |
| Use fallback loaders (`<Suspense>`)      | Delay all JS bundles blindly                  |
| Test on real devices (especially mobile) | Forget to monitor for LCP, FCP impact         |

---

## 📈 Performance Boost (Example)

### Without Lazy Loading:

* Initial load: 4.2 MB
* Time to First Paint: 3.8s

### With Lazy Loading:

* Initial load: 1.1 MB
* Time to First Paint: 1.2s

✅ Reduced load time

✅ Happier users

✅ Higher SEO score