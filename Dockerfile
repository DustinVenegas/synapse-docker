# vim: set ft=dockerfile:
FROM alpine:3.5
# Author with no obligation to maintain
MAINTAINER Paul Tötterman <paul.totterman@iki.fi>

RUN apk --no-cache add build-base ca-certificates python2-dev py2-pip su-exec \
    py2-psycopg2 py2-msgpack py2-psutil py2-openssl py2-yaml py-twisted py2-netaddr py2-cffi py2-asn1 py2-asn1-modules py2-cryptography py2-pillow py2-decorator py2-jinja2 py2-requests py2-simplejson py2-tz py2-crypto py2-dateutil py2-service_identity \
    && pip install https://github.com/matrix-org/synapse/archive/v0.19.2.tar.gz \
    && rm -rf /root/.cache \
    && addgroup -g 333 -S synapse \
    && adduser -u 333 -S -G synapse synapse
COPY entrypoint.sh /entrypoint.sh

VOLUME /data
EXPOSE 8448
EXPOSE 8008
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
