# Use the official PHP image as base
FROM php:8.0-apache

# Install dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mysqli zip

# Enable Apache modules
RUN a2enmod rewrite

# Copy Apache virtual host configuration
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Set working directory
WORKDIR /var/www/html

# Expose ports
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
