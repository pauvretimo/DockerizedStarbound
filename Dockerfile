FROM steamcmd/steamcmd:alpine-3

RUN apk add --no-cache --upgrade bash libvorbis wget tar

WORKDIR /home

RUN adduser -Ds /bin/bash steam &&\
  mkdir steamcmd

USER steam
WORKDIR ./steamcmd

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&\
  tar -zxvf steamcmd_linux.tar.gz

ENTRYPOINT ["./steamcmd.sh"]


