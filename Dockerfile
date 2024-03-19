# Use the official PHP 8.1 Apache base image
FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli

# Enable Apache modules
RUN a2enmod rewrite

# Update package lists
RUN apt-get update

# Install MySQL client
RUN apt-get install -y default-mysql-client

# Copy Apache virtual host configuration
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy PHP configuration
COPY php.ini /usr/local/etc/php/php.ini

# Set working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
