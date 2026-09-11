# Singular self-hosted image: builds web, serves via API + Postgres.
# Uses node:20-alpine (widely cached) + tsx to run the TS API directly.
FROM node:20.19-alpine AS webbuild
WORKDIR /web
COPY web/package.json ./
RUN npm install
COPY web/ ./
ARG VITE_UMAMI_URL
ARG VITE_UMAMI_WEBSITE_ID
ENV VITE_UMAMI_URL=$VITE_UMAMI_URL VITE_UMAMI_WEBSITE_ID=$VITE_UMAMI_WEBSITE_ID
RUN npm run build && date -u +%Y%m%d-%H%M > ./dist/built-at.txt

FROM node:20.19-alpine AS app
WORKDIR /app
COPY api/package.json ./
RUN npm install --omit=dev
COPY api/ ./
COPY --from=webbuild /web/dist ./public
ENV NODE_ENV=production PORT=3001
EXPOSE 3001
CMD ["npx", "tsx", "src/index.ts"]
