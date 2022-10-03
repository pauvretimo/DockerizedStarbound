FROM steamcmd/steamcmd:ubuntu-20

RUN apt update &&\
  apt install -y software-properties-common lib32gcc1 libvorbisfile3 wget tar konsole

WORKDIR /home/steamcmd

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&\
  tar -zxvf steamcmd_linux.tar.gz

COPY entrypoint.sh ./

RUN useradd -s /bin/bash steam &&\
  chown -R steam: ../steamcmd &&\
  chmod u+rwx ../steamcmd &&\
  chmod u+rwx ./entrypoint.sh

USER steam

EXPOSE 21025

ENTRYPOINT ["./entrypoint.sh"]
