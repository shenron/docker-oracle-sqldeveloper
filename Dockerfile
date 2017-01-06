FROM rafaelsoares/archlinux

RUN echo -e "[oracle]\nSigLevel = Optional TrustAll\nServer = http://linux.shikadi.net/arch/\$repo/\$arch/" >>/etc/pacman.conf

RUN pacman --noconfirm -Sy archlinux-keyring

RUN pacman -Syyu --noconfirm

RUN pacman-db-upgrade

RUN pacman --sync --noconfirm --noprogressbar --quiet jdk7-openjdk

RUN pacman --sync --noconfirm --noprogressbar --quiet libxrender libxtst libxcomposite libcups fontconfig ttf-dejavu

RUN pacman --sync --noconfirm --noprogressbar --quiet oracle-sqldeveloper

RUN echo 'AddVMOption -Dide.user.dir=/data' >> /opt/oracle-sqldeveloper/sqldeveloper/bin/sqldeveloper.conf

VOLUME /data

WORKDIR /data

ENV ORACLE_HOME /usr

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk

CMD oracle-sqldeveloper