# Example Dockerfile for full stack app
FROM node:18
WORKDIR /app
COPY backend ./backend
COPY frontend ./frontend
RUN cd backend && npm install
RUN cd ../frontend && npm install
EXPOSE 3000
CMD ["sh", "-c", "cd backend && npm start"]
