# Use the official PHP image as the base image
FROM php:7.4-apache

# Copy the application files into the container
COPY . /var/www/html

# Set the working directory in the container
WORKDIR /var/www/html

# Install necessary PHP extensions
# Install required dependencies for intl and zip extensions
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \

# Install intl and zip extensions
RUN docker-php-ext-install \
    intl \
    zip \

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Define the entry point for the container
CMD ["apache2-foreground"]
