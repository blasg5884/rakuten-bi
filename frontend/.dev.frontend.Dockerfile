# docker build -f frontend/.dev.frontend.Dockerfile -t rakuten-bi.frontend .
# docker run -it -v ./frontend/:/app -p 5173:5173 rakuten-bi.frontend /bin/bash 

FROM python:3.12

RUN apt update \
    && apt install -y nodejs \
       npm \
       jq \
    && apt clean

RUN npm install -g aws-cdk \
    && pip3 install --upgrade aws-cdk.core
    
RUN pip3 install awscli --upgrade

WORKDIR /app

EXPOSE 5123
