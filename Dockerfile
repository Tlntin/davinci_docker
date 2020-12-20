FROM ubuntu
ADD ./davinci /root/davinci
ADD ./sources.list /etc/apt/sources.list
ENV DAVINCI3_HOME /root/davinci
ENV PATH /root/davinci/bin:$DAVINCI3_HOME:$PATH
# install jdk and mysql && redis
RUN apt update && apt install openjdk-8-jdk openjdk-8-jdk-headless openjdk-8-jre openjdk-8-jre-headless -y
RUN apt install language-pack-zh-hans file libcanberra0 libgpm2 libltdl7 libmagic-mgc \
libmagic1  libmpdec2 libpython3.8 libpython3.8-minimal libpython3.8-stdlib libreadline8 \
libtdb1 libvorbisfile3 mime-support readline-common sound-theme-freedesktop vim \
  vim-common vim-runtime xxd xz-utils net-tools -y && apt clean && \
echo "export LANG=zh_CN.UTF-8" >> /root/.bashrc && \
echo "export LANGUAGE=zh_CN:zh:en_US:en" >> /root/.bashrc && \
echo "export LANG=zh_CN.UTF-8" >> /etc/profile && \
echo "export LANGUAGE=zh_CN:zh:en_US:en" >> /etc/profile && \
echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local && \
echo "zh_CN.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local && \
echo "zh_CN.GBK GBK" >> /var/lib/locales/supported.d/local && \
echo "zh_CN GB2312" >> /var/lib/locales/supported.d/local && \
apt install fonts-droid-fallback ttf-wqy-zenhei -y && \
apt install ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming -y && \
apt install vim -y && \
echo  "set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936" && \
echo  "set termencoding=utf-8" && \
echo  "set encoding=utf-8" &&\
locale-gen
EXPOSE 8080
WORKDIR /root/davinci
CMD ["init-server.sh"]