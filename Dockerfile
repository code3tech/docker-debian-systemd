FROM debian:11.5

LABEL maintainer="Code3 Tech <it.code3@gmail.com>"

ENV container docker

ENV DEBIAN_FRONTEND noninteractive

# Habilita o systemd
RUN apt-get update ; \
    apt-get install -y systemd ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    rm -rf /lib/systemd/system/multi-user.target.wants/* ; \
    rm -rf /etc/systemd/system/*.wants/* ; \
    rm -rf /lib/systemd/system/local-fs.target.wants/* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -rf /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -rf /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* ; \
    rm -rf /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup", "/tmp" ]

CMD ["/lib/systemd/systemd"]