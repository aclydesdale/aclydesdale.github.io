#!/bin/bash

# Build the Docker image
docker build -t jekyll-site .

# Run the container
docker run -it --rm \
  -p 4000:4000 \
  -v "$(pwd):/app" \
  jekyll-site 