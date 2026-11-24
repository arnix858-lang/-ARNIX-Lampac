FROM ghcr.io/lampac-nextgen/lampac:latest

WORKDIR /lampac

COPY docker/start.sh /opt/arnix/start.sh
COPY config/init.template.conf /opt/arnix/init.template.conf

RUN chmod +x /opt/arnix/start.sh

ENTRYPOINT ["/bin/sh", "/opt/arnix/start.sh"]
