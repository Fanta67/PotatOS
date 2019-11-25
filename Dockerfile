FROM gcc:latest

RUN apt-get update
RUN apt-get install qemu qemu-system cmake -yqq

CMD [ "sh", "-c", "bash" ]

ADD . /potatos
WORKDIR /potatos

