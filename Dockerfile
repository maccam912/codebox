FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git python build-essential wget screen tmux curl vim -y

RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node && cd node && git checkout v0.10.30

RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node
RUN chmod 777 -R /Development

RUN npm install -g bower grunt-cli yo codebox

RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000



RUN echo "\n##############################\nCodebox Installed!\n##############################\n"
