# ---- Base (build) ----
FROM node:18-alpine AS base
WORKDIR /app
# Install deps (works with or without package-lock.json)
COPY package*.json ./
RUN npm ci || npm install

# ---- Runtime ----
FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production
# Copy node_modules from build layer
COPY --from=base /app/node_modules ./node_modules
# Copy app source
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
