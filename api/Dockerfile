FROM oven/bun:1 AS base
WORKDIR /app
COPY package.json bun.lock* ./
RUN bun install --production || bun install
COPY . .
COPY --from=webbuild /web/dist ./public
ENV NODE_ENV=production
CMD ["bun", "src/index.ts"]

# web build stage is done in compose? Build web separately:
# docker compose builds api after web. Simpler: api serves ./public if present, else proxies.
