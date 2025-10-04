#!/bin/sh
# MariaDB'nin başlatılmasını beklemek için yazdığımız bekleme mekanizmasını burada entegre ediyoruz.
echo "Waiting for MariaDB to start..."
while ! nc -z mariadb 3306; do
  sleep 1
done
echo "MariaDB is up!"

if [ -f ./wp-config.php ]
then
    echo "Wordpress already downloaded"
else

    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php

    wp core download --allow-root
    wp core install --url=ahmsanli.42.fr --title="$WP_TITLE" --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USR $WP_EMAIL --allow-root --role=author --user_pass=$WP_PWD

    wp theme install twentytwentyfour --activate --allow-root

    wp option update default_comment_status open --allow-root
    wp option update comment_moderation 1 --allow-root
    wp option update comment_whitelist 1 --allow-root

fi

exec "$@"