# DEVELOPMENT REQUIRES NODE
FROM thecodingmachine/php:7.4-v4-fpm-node16 as cpmr-php-fpm
# PRODUCTION DOES NOT
#FROM thecodingmachine/php:7.4-v3 as cpmr-php-fpm
LABEL maintainer="Anderson Souza (https://github.com/andersonpem)"

ARG CONTAINER_CONTEXT=dev
USER root
RUN sudo chown -R www-data:www-data /var/www && sudo chmod -R ug+w /var/www
RUN apt update && apt install bash zsh wget perl git nano -y 

USER docker
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm )" ~/.zshrc
RUN echo "alias pa='php artisan'" > ~/.zshenv

USER root
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm )" ~/.zshrc
WORKDIR /tmp
RUN apt update && apt install libxrender1 xfonts-75dpi xfonts-base fontconfig -y
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
WORKDIR /var/www/html

USER www-data
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm )" ~/.zshrc


EXPOSE 6001

USER root
RUN usermod -aG www-data docker
COPY .docker/php-fpm/laravelpermissions.sh /usr/local/bin/laravelpermissions
RUN chmod +x /usr/local/bin/laravelpermissions

#Spawn the PHP-FPM Proccess