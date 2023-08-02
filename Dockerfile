FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN curl -LO https://proot.gitlab.io/proot/bin/proot
RUN chmod 755 proot
RUN mv proot /bin
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo 'luo' | vncpasswd -f > $HOME/.vnc/passwd
RUN chmod 600 $HOME/.vnc/passwd
RUN echo 'whoami ' >>/luo.sh
RUN echo 'cd ' >>/luo.sh
RUN echo "su -l -c  'vncserver :2000 -geometry 1280x800' "  >>/luo.sh
RUN echo 'cd /noVNC-1.2.0' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/luo.sh
RUN chmod 755 /luo.sh
EXPOSE 8900
RUN wget https://rclone.org/install.sh -O install.sh
RUN bash install.sh
RUN DEBIAN_FRONTEND=noninteractive apt install apt-utils autoconf automake libtool wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev  -y
ENV DEBIAN_FRONTEND noninteractive
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.07-1-Linux-x86_64.sh 
RUN bash Anaconda3-2023.07-1-Linux-x86_64.sh -b -p $HOME/conda
RUN echo '\n\

__conda_setup="$('$HOME/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"\n\

if [ $? -eq 0 ]; then\n\

    eval "$__conda_setup"\n\

else\n\

    if [ -f "$HOME/conda/etc/profile.d/conda.sh" ]; then\n\

        . "$HOME/conda/etc/profile.d/conda.sh"\n\

    else\n\

        export PATH="$HOME/conda/bin:$PATH"\n\

    fi\n\

fi\n\

unset __conda_setup\n'\

>> ~/.bashrc && \

    /bin/bash -c 'source  ~/.bashrc'
RUN conda create --name sd python=3.8
RUN DEBIAN_FRONTEND=noninteractive apt install zip -y
RUN cd $HOME/
RUN touch 1.txt
RUN echo 'https://ql0b-my.sharepoint.com/:f:/g/personal/abz_ql0b_onmicrosoft_com/EkyHyTd4ONxPtLl6ojgmrWkBUtswWjPohEnKNB-MXNWw3A?e=IxlWdP' > '1.txt'
CMD  /luo.sh  
