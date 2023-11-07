# Use an official Node.js runtime as the base image
FROM node:14.21.0

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the rest of your application code to the working directory
COPY . .

# Build your Angular application
RUN ng build --prod

# Expose the port the app will run on
EXPOSE 88

# Start the application
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "88"]
