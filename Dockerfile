# ---- Build Stage ----
FROM node:20 AS build

WORKDIR /app

# Install dependencies first (better caching)
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Build Nuxt app (this creates .output)
RUN npm run build


# ---- Production Stage ----
FROM node:20 AS production

WORKDIR /app

ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3000

# Copy ONLY built output (important)
COPY --from=build /app/.output ./.output
COPY --from=build /app/package*.json ./

# Install only production deps (optional but safe)
RUN npm install --omit=dev

EXPOSE 3000

# Start Nitro server directly (BEST for Nuxt 3)
CMD ["node", ".output/server/index.mjs"]

