wget https://ftp.gnu.org/gnu/automake/automake-1.11.tar.gz
wget https://ftp.gnu.org/gnu/autoconf/autoconf-2.65.tar.gz

tar xvf automake-1.11.tar.gz
tar xvf autoconf-2.65.tar.gz

mkdir /root/tools
mkdir build

(cd build && \
    ../automake-1.11/configure --prefix="/root/tools" && \
    make && make install && \
    ../autoconf-2.65/configure --prefix="/root/tools" && \
    make && make install

)