FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git python build-essential wget screen tmux curl -y

RUN mkdir /Development
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.13.0/install.sh | bash

# source ~/.profile
RUN nvm install 0.10.30

RUN chmod 777 -R /Development

RUN npm install -g bower grunt-cli yo codebox

RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

RUN codebox --root=/Development --open

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000



RUN echo "\n##############################\nCodebox Installed!\n##############################\n"
