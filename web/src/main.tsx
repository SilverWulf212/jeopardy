import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import "./styles/globals.css";

// Umami analytics (self-hosted): set VITE_UMAMI_URL + VITE_UMAMI_WEBSITE_ID to enable.
const umamiUrl = import.meta.env.VITE_UMAMI_URL as string | undefined;
const umamiId = import.meta.env.VITE_UMAMI_WEBSITE_ID as string | undefined;
if (umamiUrl && umamiId && !document.querySelector('script[data-website-id]')) {
  const s = document.createElement("script");
  s.defer = true;
  s.src = `${umamiUrl.replace(/\/$/, "")}/script.js`;
  s.dataset.websiteId = umamiId;
  document.head.appendChild(s);
}

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
