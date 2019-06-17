FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y build-essential clang libdbus-1-dev libgtk-3-dev     \
                       libnotify-dev libgnome-keyring-dev libgconf2-dev        \
                       libasound2-dev libcap-dev libcups2-dev libxtst-dev      \
                       libxss1 libnss3-dev gcc-multilib g++-multilib curl      \
                       gperf bison python-dbusmock openjdk-8-jre               \               
    && sysctl kernel.unprivileged_userns_clone=1 \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*




USER gitpod
  
RUN mkdir -p /home/gitpod/rocksetta                                                                            \ 
    && mkdir -p /home/gitpod/rocksetta/logs                                                                    \ 
    && mkdir -p /home/gitpod/.android                                                                          \
    && touch /home/gitpod/.android/repositories.cfg                                                            \
    && touch /home/gitpod/rocksetta/logs/mylogs.txt                                                            \
    && echo "Installation start, made some folders in /home/gitpod" >> /home/gitpod/rocksetta/logs/mylogs.txt  \
    && echo "Try electron" >> /home/gitpod/rocksetta/logs/mylogs.txt                                           \
    && npm install -g  electron                                                                                \
    && echo "Back to root to install the Android sdk" >> /home/gitpod/rocksetta/logs/mylogs.txt                
    


# Give back control
USER root

WORKDIR /home/gitpod/.android

RUN chmod -R 775 /home/gitpod                                                              \
    && chown -R gitpod:gitpod /home/gitpod                              





USER gitpod


RUN  echo "ls -ls /home/gitpod"       >> /home/gitpod/rocksetta/logs/mylogs.txt             \
     && ls -ls /home/gitpod           >> /home/gitpod/rocksetta/logs/mylogs.txt             \
     &&  echo "Installation all done" >> /home/gitpod/rocksetta/logs/mylogs.txt          


# Give back control
USER root


# Cleaning
RUN apt-get clean

