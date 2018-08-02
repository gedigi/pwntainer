FROM ubuntu:18.04
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -fy upgrade

# install main packages
RUN apt-get install -fy build-essential gdb libc6-i386 libc6:i386 python \
 python3 python-pip python3-pip cmake wget git net-tools locales vim tmux ruby \
 socat netcat-traditional curl gcc-multilib

# install pwntools
RUN pip install pwntools

# install gef + requirements
RUN pip3 install capstone unicorn keystone-engine ropper
RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# install r2
WORKDIR "/opt"
RUN git clone https://github.com/radare/radare2.git
WORKDIR "radare2/sys"
RUN ./install.sh

# install one_gadget
RUN gem install one_gadget

# install angr
RUN pip install angr

# install frida
RUN pip3 install frida frida-tools

# install libcdb
WORKDIR "/opt"
RUN git clone https://github.com/niklasb/libc-database.git
WORKDIR "libc-database"
RUN bash ./get ; exit 0

# set locale to English/UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# fix libkeystone.so path
RUN ln -s \
 /usr/local/lib/python3.6/dist-packages/usr/lib/python3/dist-packages/keystone/libkeystone.so \
 /usr/local/lib/python3.6/dist-packages/keystone/

# install a nice .vimrc
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

# go back to ~
 WORKDIR "/root"
