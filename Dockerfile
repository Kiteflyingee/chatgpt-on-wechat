FROM python:3.10-alpine

LABEL maintainer="foo@bar.com"
ARG TZ='Asia/Shanghai'

WORKDIR /app

COPY . .

RUN apk add --no-cache bash ffmpeg espeak \
    && cp config-template.json config.json \
    && /usr/local/bin/python -m pip install --no-cache --upgrade pip \
    && pip install numpy-1.24.1-cp310-cp310-linux_x86_64.whl \
    && pip install --no-cache -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --extra-index-url https://alpine-wheels.github.io/index\
    && pip install --no-cache -r requirements-optional.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --extra-index-url https://alpine-wheels.github.io/index

CMD ["python app.py"]