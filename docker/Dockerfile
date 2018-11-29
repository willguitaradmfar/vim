FROM alpine

RUN apk update && apk add neovim the_silver_searcher curl git

RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD . /app

RUN mkdir -p /tmp/fonts

RUN mkdir -p ~/.vim/plugged

RUN mkdir -p ~/.config/nvim

RUN cp /app/init.vim ~/.config/nvim

RUN nvim -i NONE -c PlugInstall -c quitall

FROM node:8.11.0-alpine

RUN apk update && apk add neovim the_silver_searcher git fontconfig

COPY --from=0 /root /root

COPY --from=0 /app/docker/ /app/docker/

WORKDIR /workspace

ENTRYPOINT [ "sh", "/app/docker/entry.sh" ]

