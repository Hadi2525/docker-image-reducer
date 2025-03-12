# Stage 1: Build the React app
FROM node:22 AS builder
WORKDIR /app/frontend
COPY frontend/package.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Setup FastAPI backend
FROM python:3.12-slim
WORKDIR /app
RUN pip install fastapi uvicorn

# Copy FastAPI backend code
COPY backend/ ./backend/

# Copy the built React app from the builder stage
COPY --from=builder /app/frontend/build/ ./static/

# Expose port 8000
EXPOSE 8000

# Start FastAPI server
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]