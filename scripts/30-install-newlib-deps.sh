# because fuck you, that's why

source /root/perl5/perlbrew/etc/bashrc

wget https://ftp.gnu.org/gnu/automake/automake-1.11.1.tar.gz
wget https://ftp.gnu.org/gnu/autoconf/autoconf-2.64.tar.gz

tar xvf automake-1.11.1.tar.gz
tar xvf autoconf-2.64.tar.gz

mkdir /root/tools
mkdir build

(cd build && \
    ../automake-1.11.1/configure --prefix="/root/tools" && \
    make && make install && \
    ../autoconf-2.64/configure --prefix="/root/tools" && \
    make && make install

)

apt-get remove autoconf automake -yqq

# unholy fuckery
(cd /root/tools/ && wget https://github.com/lordmilko/i686-elf-tools/releases/download/7.1.0/i686-elf-tools-linux.zip && unzip i686-elf-tools-linux.zip)

# hyper turbo-aids
(cd /root/tools/bin/ && \
    ln i686-elf-ar i686-potatos-ar && \
    ln i686-elf-as i686-potatos-as && \
    ln i686-elf-gcc i686-potatos-gcc && \
    ln i686-elf-gcc i686-potatos-cc && \
    ln i686-elf-ranlib i686-potatos-ranlib)

