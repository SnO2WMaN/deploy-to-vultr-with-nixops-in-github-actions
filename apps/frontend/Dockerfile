# pnpm installed
FROM node:18-alpine as pnpm-installed
WORKDIR /app

RUN wget -qO- https://unpkg.com/@pnpm/self-installer | node

# builder
FROM pnpm-installed as builder

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY \
  index.html \
  tsconfig.json \
  vite.config.ts \
  ./
COPY src ./src
COPY public ./public
RUN pnpm run build

# deps
FROM pnpm-installed as deps
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile --prod

# runner
FROM flashspys/nginx-static

COPY --from=builder /app/dist /static
