FROM k8s.gcr.io/nginx-slim:0.8

MAINTAINER yks0000@gmail.com

WORKDIR /

COPY custom-index.sh .
RUN apt-get update \
    && apt-get install procps vim dnsutils netcat build-essential libssl-dev git -y \
    && git clone https://github.com/wg/wrk.git wrk \
    && cd wrk
    && make
    && cp wrk /usr/local/bin \
    && chmod +x custom-index.sh \

ENTRYPOINT ['/bin/sh', '/custom-index.sh']