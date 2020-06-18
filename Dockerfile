FROM php:latest
MAINTAINER Luiz Jr <lj@luizjr.dev>

# Update packages and Install dependencies
RUN apt-get update && apt-get install -y \
	    git \
	    libcurl4-gnutls-dev \
	    libicu-dev \
	    libvpx-dev \
	    libjpeg-dev \
	    libpng-dev \
	    libxpm-dev \
	    zlib1g-dev \
	    libfreetype6-dev \
      libmcrypt-dev \
	    libxml2-dev \
	    libexpat1-dev \
	    libbz2-dev \
	    libgmp3-dev \
	    libldap2-dev \
	    unixodbc-dev \
	    libpq-dev \
	    libsqlite3-dev \
	    libaspell-dev \
	    libsnmp-dev \
	    libpcre3-dev \
	    libtidy-dev \
	    software-properties-common \
      libzip-dev \
	    zip unzip \
	    ntfs-3g \
	    cifs-utils \
      libonig-dev \
	    gnupg -y

# Install php extensions
RUN docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcach soap tidy bcmath \

# Install & enable Xdebug for code coverage reports
RUN pecl install xdebug \
    docker-php-ext-enable xdebug
