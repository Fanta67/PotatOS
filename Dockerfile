FROM ubuntu:xenial

ADD . /potatos

RUN sh /potatos/scripts/00-install-deps.sh
RUN sh /potatos/scripts/10-install-bfg9k.sh

# click trick
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# set up automake/autoconf for newlib
RUN sh /potatos/scripts/20-install-newlib-deps.sh
ENV PATH=/root/tools/bin:$PATH

WORKDIR /potatos

CMD [ "sh", "-c", "bash" ]