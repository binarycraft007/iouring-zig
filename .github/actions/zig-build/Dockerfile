FROM archlinux:latest

ADD bootstrap.sh /
RUN bash -c "/bootstrap.sh"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
