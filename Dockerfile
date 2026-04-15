FROM lscr.io/linuxserver/baseimage-alpine:3.20

RUN apk add --no-cache fuse3 bash wget unzip

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

RUN wget -qO /tmp/rclone.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip \
    && unzip -q /tmp/rclone.zip -d /tmp \
    && mv /tmp/rclone-*-linux-amd64/rclone /usr/bin/rclone \
    && chmod +x /usr/bin/rclone \
    && rm -rf /tmp/rclone*

COPY root/ /