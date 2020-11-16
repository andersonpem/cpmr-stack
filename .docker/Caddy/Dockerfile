FROM caddy:2.2.1 AS cpmr-caddy
LABEL maintainer="Anderson Souza <https://gitlab.com/andersonpem https://github.com/andersonpem>"
USER root
RUN apk add bash zsh perl git nano tzdata > /dev/null
ENV TZ America/Sao_Paulo
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" /root/.zshrc > /dev/null
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" /root/.zshrc > /dev/null
# Clear APK cache
RUN rm -rf /var/cache/apk/*
COPY ./.docker/Caddy/Caddyfile /etc/caddy/Caddyfile
RUN echo "Build OK"