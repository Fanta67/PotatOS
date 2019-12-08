apt install perlbrew -yqq
perlbrew init

perlbrew install -j9 --notest perl-5.16.0

cat /root/perl5/perlbrew/etc/bashrc >> /root/.bashrc
echo "perlbrew use 5.16.0" >> /root/.bashrc
touch /root/.bashrc
