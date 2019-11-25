FROM gcc:latest

ADD . /potatos
WORKDIR /potatos

RUN apt-get update
RUN apt-get install qemu qemu-system python3 python3-pip cmake -yqq

# set up BFG9K
RUN pip3 install click
RUN ln -s /potatos/tools/bfg9k/bfg9k /usr/bin/bfg9k
RUN chmod +x /usr/bin/bfg9k

CMD [ "sh", "-c", "bash" ]