# 如何使用
```shell
docker build -t twitter_cc . && docker rm -f twitter_cc ; docker run --shm-size=2g --name twitter_cc -p 8080:5000 twitter_cc
docker build -t twitter_cc . && docker rm -f twitter_cc ; docker run --shm-size=2g -d --name twitter_cc -p 8080:5000 twitter_cc
```

https://aws.amazon.com/cn/blogs/aws/new-for-aws-lambda-container-image-support/

# 登录仓库
```shell
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 238417667751.dkr.ecr.us-west-2.amazonaws.com
```

# 推到仓库
```shell
docker build -t twitter_cc .
docker tag twitter_cc:latest 238417667751.dkr.ecr.us-west-2.amazonaws.com/twitter_cc:latest
docker push 238417667751.dkr.ecr.us-west-2.amazonaws.com/twitter_cc:latest
```

```shell
docker rm twitter_cc; docker run --shm-size=2g --name twitter_cc -p 8080:5000 238417667751.dkr.ecr.us-west-2.amazonaws.com/twitter_cc:latest 
```