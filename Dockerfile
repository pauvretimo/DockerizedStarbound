FROM steamcmd/steamcmd:alpine-3

RUN apk add --no-cache --upgrade bash libvorbis wget tar

WORKDIR /home/steamcmd

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&\
  tar -zxvf steamcmd_linux.tar.gz

RUN adduser -Ds /bin/bash steam &&\
  chown -R steam: steamcmd &&\
  chmod u+rwx steamcmd

USER steam

EXPOSE 21025
ENTRYPOINT ["./steamcmd.sh"]


