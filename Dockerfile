FROM alpine:3.9

WORKDIR /app/
COPY ./ ./

RUN set -x \
 && apk --no-cache --update add python3 py3-pip \
 && pip3 install --no-cache-dir -r requirements.txt

ENV EXCLUDE_URLS=.*github.com

ENTRYPOINT [ "python3", "-u", "crawler/crawler.py" ]
CMD [ "https://vitkhab.github.io/search_engine_test_site/" ]
