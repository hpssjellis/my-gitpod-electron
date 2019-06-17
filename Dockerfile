FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y libgtk-3-0 \
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
    






RUN  echo "ls -ls /home/gitpod"       >> /home/gitpod/rocksetta/logs/mylogs.txt             \
     && ls -ls /home/gitpod           >> /home/gitpod/rocksetta/logs/mylogs.txt             \
     &&  echo "Installation all done" >> /home/gitpod/rocksetta/logs/mylogs.txt          


# Give back control
USER root


# Cleaning
RUN apt-get clean

