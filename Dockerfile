FROM php:7.4-alpine

ARG COMPOSER_CMD="install"

ENV APP_ROOT="/usr/src/fos-oauth-server-bundle" \
    CONTAINER_USER="fos-oauth" \
    EXT_FILE_PREFIX="docker-php-ext-" \
    EXT_ROOT="/usr/local/etc/php/conf.d/"

ENV HOME_DIR="/home/${CONTAINER_USER}"

RUN addgroup -g 1000 -S $CONTAINER_USER \
    && adduser -u 1000 -S $CONTAINER_USER -G $CONTAINER_USER -s /bin/sh -D $CONTAINER_USER \
    && apk add --no-cache --virtual \
        .build-deps \
        autoconf \
        g++ \
        icu-dev \
        libsodium-dev \
        make \
    && docker-php-ext-install sodium \
    && pecl install mongodb-1.9.0 \
    && docker-php-ext-enable mongodb \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    # Install Composer.
    && php -r "copy('https://getcomposer.org/installer', '/root/composer-setup.php');" \
    && php /root/composer-setup.php --install-dir=/usr/bin --filename=composer \
    && rm -f /root/composer-setup.php

WORKDIR ${APP_ROOT}

COPY composer.json composer.json
COPY composer.lock composer.lock
RUN composer ${COMPOSER_CMD} --no-scripts --no-interaction --no-autoloader \
    && chown -R 1000:1000 vendor \
    && rm -rf /root/.composer \
    && mv vendor ${HOME_DIR}/vendor

COPY --chown=1000:1000 . ${APP_ROOT}

RUN mv ${HOME_DIR}/vendor ${APP_ROOT}/vendor

USER ${CONTAINER_USER}
