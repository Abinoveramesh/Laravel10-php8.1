# Use the official PHP 8.1 image as base
FROM php:8.1

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory in the container
WORKDIR /var/www/html

# Copy the application code into the container
COPY . /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the application
CMD ["php", "-S", "0.0.0.0:80"]
