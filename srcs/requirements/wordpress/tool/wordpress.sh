#!/bin/bash

# Update PHP-FPM listen port
sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Create WordPress directory and download core files
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
wp core download --path=/var/www/html/wordpress --allow-root

# Create WordPress config file
wp config create --dbhost=mariadb --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} \
 --dbpass=${MYSQL_PASSWORD} --path=/var/www/html/wordpress --allow-root --skip-check

# Install WordPress and create admin user
wp core install --url=${DNS} --title="Inception project" --admin_name=${WORDPRESS_USER} --admin_password=${WORDPRES_PASS} --admin_email="${ADMIN_EMAIL}"  --path=/var/www/html/wordpress --allow-root
wp user create "${USER}" "${EMAIL}" --user_pass=${WORDPRES_PASS}  --allow-root --path=/var/www/html/wordpress

# Install Redis Cache plugin and enable Redis object caching
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root 

# Set appropriate file permissions
find /var/www/html/wordpress/ -type d -exec chmod 755 {} \;
chown -R www-data:www-data /var/www/html/wordpress/

sed -i '75s/.*/define( 'WP_REDIS_HOST', 'redis' );/' /var/www/html/wordpress/wp-config.php
sed -i '76s/.*/define( 'WP_REDIS_PORT', 6379 );/' /var/www/html/wordpress/wp-config.php
sed -i '77s/.*/define( 'WP_CACHE', true );/' /var/www/html/wordpress/wp-config.php

# Start PHP-FPM
mkdir -p /run/php
php-fpm7.3 -F
