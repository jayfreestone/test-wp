FROM wordpress:latest
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Install app dependencies
RUN cd /app && \
    composer install --no-interaction
COPY app /var/www/html