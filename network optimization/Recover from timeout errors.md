# 🛠️ Graceful Recovery from Timeouts & Errors

## 🔄 1. Long-Polling

### 🔥 Common Issues:

* Request times out (`504 Gateway Timeout`)
* Server is temporarily down
* Network connection drops

### ✅ How to Handle Gracefully:

```javascript
function poll() {
  fetch('/poll')
    .then(res => res.json())
    .then(data => {
      updateUI(data);
      setTimeout(poll, 1000); // re-poll after delay
    })
    .catch(err => {
      console.error('Polling error:', err);
      setTimeout(poll, 5000); // retry with backoff
    });
}
```

✅ Add **retry with backoff** (e.g. 5s, 10s...)

✅ Show a **loading or reconnecting UI**

✅ Use **timeouts** and **abort controllers** to prevent hanging requests

---

## 📡 2. Server-Sent Events (SSE)

### 🔥 Common Issues:

* Network errors
* Server goes down
* Bad proxy configurations

### ✅ Built-in Recovery:

SSE automatically **reconnects** when the connection drops!

### ✅ Manual Error Handling:

```javascript
const eventSource = new EventSource('/events');

eventSource.onmessage = (e) => {
  console.log('Message:', e.data);
};

eventSource.onerror = (e) => {
  console.error('SSE error:', e);
  // Browser retries automatically, but you can show reconnecting UI
};
```

✅ SSE supports `Last-Event-ID` for **resuming** missed events

✅ Server must send this:

```http
id: 12345
data: New message
```

---

## 🔌 3. WebSockets

### 🔥 Common Issues:

* Connection refused or closed unexpectedly
* Network loss or server crash
* Proxy/firewall blocking WebSocket traffic

### ✅ Reconnect Logic:

```javascript
let socket;
let reconnectDelay = 2000;

function connectWebSocket() {
  socket = new WebSocket('wss://example.com/socket');

  socket.onopen = () => {
    console.log('✅ Connected');
    reconnectDelay = 2000; // Reset delay on success
  };

  socket.onmessage = (e) => {
    console.log('Message:', e.data);
  };

  socket.onerror = (e) => {
    console.error('WebSocket error:', e);
  };

  socket.onclose = (e) => {
    console.warn('WebSocket closed. Reconnecting...');
    setTimeout(connectWebSocket, reconnectDelay);
    reconnectDelay = Math.min(reconnectDelay * 2, 30000); // Exponential backoff
  };
}

connectWebSocket();
```

✅ Use **exponential backoff** to avoid hammering the server

✅ Reset reconnect timer once connected

✅ Optionally show a “🔄 Reconnecting…” indicator to users

---

## 🧠 Best Practices for All 3

| 👍 Practice              | 💡 Reason                                         |
| ------------------------ | ------------------------------------------------- |
| ✅ Retry with backoff     | Prevents overload if server is down               |
| ✅ Detect disconnection   | Use `onerror`, `onclose`, `timeout` handlers      |
| ✅ Show feedback to users | Don’t leave users wondering (use spinners/alerts) |
| ✅ Log or track errors    | Helps debug production issues                     |
| ✅ Abort long requests    | Avoids memory leaks and zombie connections        |

---

## 🧪 Bonus: Timeout Example with Fetch

```javascript
const controller = new AbortController();

setTimeout(() => controller.abort(), 5000); // 5 sec timeout

fetch('/poll', { signal: controller.signal })
  .then(res => res.json())
  .catch(err => {
    if (err.name === 'AbortError') {
      console.warn('Request timed out');
    } else {
      console.error('Other fetch error:', err);
    }
  });
```

---

## 🏁 TL;DR: Recovery Summary

| Method       | Built-in Retry? | Manual Retry Needed? | Ideal Strategy                   |
| ------------ | --------------- | -------------------- | -------------------------------- |
| Long-Polling | ❌ No            | ✅ Yes                | Retry with backoff & error UI    |
| WebSocket    | ❌ No            | ✅ Yes                | Reconnect with exponential delay |
| SSE          | ✅ Yes           | 🚫 Optional          | Let browser auto-reconnect       |