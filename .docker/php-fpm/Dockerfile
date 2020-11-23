# DEVELOPMENT REQUIRES NODE
FROM thecodingmachine/php:7.4-v3-fpm-node12 as cpmr-php-fpm
# PRODUCTION DOES NOT
#FROM thecodingmachine/php:7.4-v3 as cpmr-php-fpm
LABEL maintainer="Anderson Souza (https://github.com/andersonpem)"

ARG CONTAINER_CONTEXT=dev
USER root
RUN sudo mkdir /var/www/.composer && sudo chown www-data:www-data /var/www/.composer && sudo chmod ug+w /var/www/.composer
RUN sudo chown -R www-data:www-data /var/www && sudo chmod -R ug+w /var/www
RUN apt update && apt install bash zsh wget perl git nano -y 
USER docker
RUN composer global remove hirak/prestissimo
USER root
RUN composer self-update 2.0.7
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" ~/.zshrc

USER www-data
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" ~/.zshrc

USER docker
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" --unattended > /dev/null
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
RUN sed -i "/ZSH_THEME=\"robbyrussell\"/c ZSH_THEME=\"fishy\"" ~/.zshrc
RUN sed -i "/plugins=(git)/c plugins=(git docker zsh-autosuggestions ubuntu debian ufw laravel npm npx)" ~/.zshrc

EXPOSE 6001

USER root
RUN usermod -aG www-data docker
COPY .docker/php-fpm/laravelpermissions.sh /usr/local/bin/laravelpermissions
RUN chmod +x /usr/local/bin/laravelpermissions

#Spawn the PHP-FPM Proccess