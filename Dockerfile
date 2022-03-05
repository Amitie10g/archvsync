FROM       debian:stable-slim
MAINTAINER Paul Tagliamonte <paultag@debian.org>

RUN apt-get update && apt-get install -y \
    adduser \
    rsync

RUN adduser \
    --system \
    --home=/opt/ftp-master.debian.org/archvsync/ \
    --shell=/bin/bash \
    --no-create-home \
    --group \
    archvsync

COPY / /opt/ftp-master.debian.org/
WORKDIR /opt/ftp-master.debian.org/
RUN chown -R archvsync:archvsync ./archvsync
WORKDIR /opt/ftp-master.debian.org/archvsync/

ENV PATH /opt/ftp-master.debian.org/archvsync/bin:${PATH}

CMD ["ftpsync"]
