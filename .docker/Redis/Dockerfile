FROM redis:latest as cpmr-redis
ARG REDIS_SECRET=password
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
LABEL contributor="Anderson Silva <andersonsilva.souza@outlook.com>"

RUN apt update >/dev/null && apt install python3 nano -y > /dev/null
RUN rm -rf /var/cache/apt/archives

## For security settings uncomment, make the dir, copy conf, and also start with the conf, to use it
RUN mkdir -p /usr/local/etc/redis
COPY ./.docker/Redis/redis.conf /usr/local/etc/redis/redis.conf

#Copy Entrypoint
COPY ./.docker/Redis/entrypoint /usr/bin/start-redis
COPY ./.docker/Redis/redispass.py /usr/bin/redispass
RUN chmod +x /usr/bin/start-redis
RUN chmod +x /usr/bin/redispass

VOLUME /data

EXPOSE 6379

ENTRYPOINT [ "/usr/bin/start-redis" ]
# CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
# CMD ["redis-server"]
