# 1. use ubuntu 18.04 as base image
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# defining user root
USER root

# OS update
RUN apt-get -y update

RUN apt-get install -y wget
RUN apt-get install -y build-essential

# 安装chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable

# Expose ports
EXPOSE 5000

# add file
ADD * /

# 下载npm，安装
RUN apt-get install -y npm python3 python3-pip
RUN npm install -g chrome-har-capturer
RUN pip3 install -r requirements.txt

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1

# Set the default command to execute
CMD ["cd /var/task/"]
CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]
#ENTRYPOINT ["google-chrome", "--remote-debugging-port=9222", "--headless", "--no-sandbox", "--disable-gpu"]
