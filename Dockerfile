# Stage 1: Build the website using Node/Parcel
FROM node:20-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Copy package files and install dependencies
COPY package.json ./
RUN npm install

# Copy source files
COPY src/ ./src/
COPY styles/ ./styles/
COPY .htmlhintrc ./
COPY .stylelintrc.json ./

# Run linters then build
RUN npm run lint:html
RUN npm run lint:css
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy built files from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
