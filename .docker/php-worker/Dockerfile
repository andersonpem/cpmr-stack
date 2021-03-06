# DEVELOPMENT REQUIRES NODE
FROM thecodingmachine/php:7.4-v3-fpm-node12 as cpmr-php-worker
# PRODUCTION DOES NOT
#FROM thecodingmachine/php:7.4-v3 as cpmr-php-fpm
LABEL maintainer="Anderson Souza (https://github.com/andersonpem)"

ARG CONTAINER_CONTEXT=dev
USER root
RUN apt update && apt install bash zsh wget perl git nano -y 
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" ~/.zshrc
RUN if [ ${CONTAINER_CONTEXT} = prod ]; then \
        chown -R www-data:www-data /var/www/ \
        chown -R www-data:www-data /var/www/html \
    else \
        chown -R docker:docker /var/www/ \
        chown -R docker:docker /var/www/html \
;fi

USER www-data
RUN if [ ${CONTAINER_CONTEXT} = prod ]; then \
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null \
    sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc \
    sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" ~/.zshrc \
;fi

USER docker
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" ~/.zshrc
EXPOSE 6001
#Spawn the PHP-FPM Proccess
USER root
COPY ./.docker/php-worker/worker.sh /usr/bin/worker
RUN chmod +x /usr/bin/worker
USER docker
ENTRYPOINT ["worker"]