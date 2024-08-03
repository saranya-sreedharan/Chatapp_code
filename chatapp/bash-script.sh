#!/bin/bash

# Update package repositories in the system
sudo apt update

# Check if Docker is installed, if not install it
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    sudo apt install docker.io -y
fi

# Get the public IP address of the running host
public_ip=$(curl -s http://checkip.amazonaws.com)

# Replace "localhost" with the public IP address in singlechat.php and index.php
sed -i "s/localhost/$public_ip/g" ownchatapp/singlechat.php
sed -i "s/localhost/$public_ip/g" ownchatapp/index.php

# Build the Docker image
echo "Building Docker image..."
sudo docker build -t chat-app:1.0 .

# Run the Docker container
echo "Starting Docker container..."
<<<<<<< HEAD
sudo docker run  -p 80:80 -p 8080:8080 chat-app:1.0
=======
sudo docker run  -p 80:80 -p 8080:8080 chat-app:1.0
>>>>>>> 97455db87ecfd3fb343b1655fdccdebcdc9912d5
