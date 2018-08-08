FROM ubuntu:latest
LABEL maintainer="zak@whiteblock.io"

RUN apt update && apt install -y apt-utils tzdata && apt install -y expect nodejs git git-extras software-properties-common tmux

RUN apt install -y git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 curl libminiupnpc-dev libqrencode-dev libboost-all-dev &&\
	add-apt-repository -y ppa:bitcoin/bitcoin &&\
	apt update &&\
	apt install -y libdb4.8-dev libdb4.8++-dev iputils-ping 
	
RUN git clone https://github.com/syscoin/syscoin.git &&\
	cd syscoin &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

EXPOSE 8369 8370

ENTRYPOINT ["/bin/sh"]