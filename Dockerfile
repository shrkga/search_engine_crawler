FROM alpine:3.9

WORKDIR /app/
COPY ./ ./

RUN set -x \
 && apk --no-cache --update add python3 py3-pip python3-dev build-base gcc musl-dev \
 && pip3 install --no-cache-dir -r requirements.txt \
 && apk del python3-dev build-base

ENV URL=https://vitkhab.github.io/search_engine_test_site/
ENV EXCLUDE_URLS=.*github.com

ENTRYPOINT [ "python3", "-u", "crawler/crawler.py" ]
CMD [ "${URL}" ]
