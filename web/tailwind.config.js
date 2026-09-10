/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{ts,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        display: ["Bitter", "Georgia", "serif"],
        value: ["Oswald", "Impact", "sans-serif"],
      },
    },
  },
  plugins: [],
};
