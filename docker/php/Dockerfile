FROM php:7-fpm

MAINTAINER Gibson Starkweather <gibson@boaf.co>

RUN apt-get update \
    && apt-get install -y \
      libbz2-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng12-dev \
      libxml2-dev \
      git \
      unzip \
    --no-install-recommends && rm -rf /var/lib/apt-lists/*

RUN docker-php-ext-install bz2 mbstring mcrypt pdo_mysql soap zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg=/usr/include \
    && docker-php-ext-install gd

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN INSTALLER=/tmp/c-install.php && SIG=/tmp/c-install.sig \
    && curl https://getcomposer.org/installer > ${INSTALLER} \
    && curl https://composer.github.io/installer.sig > ${SIG} \
    && php -r "if (hash('SHA384', file_get_contents('${INSTALLER}')) !== trim(file_get_contents('${SIG}'))) { unlink('${INSTALLER}'); unlink('${SIG}'); echo 'corrupt installer' . PHP_EOL; exit(1); }" \
    && php ${INSTALLER} --install-dir=/usr/local/bin --filename=composer \
    && rm -f ${INSTALLER} ${SIG} \
    && composer --version

CMD ["php-fpm", "-F"]
