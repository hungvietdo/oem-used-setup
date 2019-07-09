FROM php:7.0-apache-jessie

RUN apt-get update && apt-get install --no-install-recommends -y \
    libcurl4-openssl-dev \
    libxml2-dev \
    libmagickwand-dev \
    libssl-dev \
    pkg-config \
    git \
    ssh

RUN docker-php-ext-install pdo_mysql gd sockets wddx soap

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

RUN a2enmod rewrite ssl

COPY resources/oem-used-apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY resources/oem-used-php.ini /usr/local/etc/php/php.ini
COPY secret/id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
