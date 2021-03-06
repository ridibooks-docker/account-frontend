FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y curl make software-properties-common build-essential apt-transport-https ca-certificates \
    \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs \
    \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && apt-get update \
    && apt-get install -y docker-ce \
    \
    && apt-get install -y make python3 python3-pip libmysqlclient-dev libssl-dev \
    && add-apt-repository --yes ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.7 python3.7-dev python3-pip \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 \
    \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn webpack webpack-cli

RUN pip3 install --upgrade pip setuptools pipenv awscli boto3 ecs-deploy docker-compose  

# install ecl-cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli


WORKDIR /htdocs/www
