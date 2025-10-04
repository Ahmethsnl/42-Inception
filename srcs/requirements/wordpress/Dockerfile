FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    wget \
    curl \
    gnupg2 && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt-get update && apt-get install -y \
    bash \
    netcat \
    php7.3 \
    php7.3-cli \
    php7.3-cgi \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-pdo \
    php7.3-gd \
    php7.3-mbstring \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]