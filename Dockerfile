FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y nodejs npm make curl && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn webpack webpack-cli

# Clean up
RUN 
    
WORKDIR /htdocs/www
