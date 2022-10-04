FROM steamcmd/steamcmd:alpine-3

RUN apk add --no-cache --upgrade bash libvorbis wget tar libstdc++ libgcc icu-libs

# Fix 32 and 64 bit library conflicts
RUN mkdir /steamlib \
 && mv /lib/libstdc++.so.6 /steamlib \
 && mv /lib/libgcc_s.so.1 /steamlib
ENV LD_LIBRARY_PATH /steamlib

WORKDIR /home/steamcmd

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&\
  tar -zxvf steamcmd_linux.tar.gz

COPY entrypoint.sh ./

RUN adduser -Ds /bin/bash steam &&\
  chown -R steam: ../steamcmd &&\
  chmod u+rwx ../steamcmd &&\
  chmod u+rwx ./entrypoint.sh

USER steam

EXPOSE 21025

ENTRYPOINT ["./entrypoint.sh"]
