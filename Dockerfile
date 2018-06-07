FROM wordpress:latest
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY app /var/www/html
# Install app dependencies
RUN cd /var/www/html && \
    composer install --no-interaction
