# ./docker/php/Dockerfile

# FROM composer:2.0 as composer

FROM php:7.4-fpm

RUN docker-php-ext-install pdo_mysql

RUN pecl install apcu

RUN apt-get update && apt-get install -y libzip-dev
RUN apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick

RUN docker-php-ext-install zip
RUN docker-php-ext-enable apcu
RUN docker-php-ext-enable imagick

RUN printf '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE policymap [<!ELEMENT policymap (policy)+><!ATTLIST policymap xmlns CDATA #FIXED ""><!ELEMENT policy EMPTY><!ATTLIST policy xmlns CDATA #FIXED ""><!ATTLIST policy domain NMTOKEN #REQUIRED><!ATTLIST policy name NMTOKEN #IMPLIED><!ATTLIST policy pattern CDATA #IMPLIED><!ATTLIST policy rights NMTOKEN #IMPLIED><!ATTLIST policy stealth NMTOKEN #IMPLIED><!ATTLIST policy value CDATA #IMPLIED>]><policymap xmlns=""><policy xmlns="" domain="resource" name="memory" value="256MiB"/><policy xmlns="" domain="resource" name="map" value="512MiB"/><policy xmlns="" domain="resource" name="width" value="16KP"/><policy xmlns="" domain="resource" name="height" value="16KP"/><policy xmlns="" domain="resource" name="area" value="128MB"/><policy xmlns="" domain="resource" name="disk" value="1GiB"/><policy xmlns="" domain="delegate" rights="none" pattern="URL"/><policy xmlns="" domain="delegate" rights="none" pattern="HTTPS"/><policy xmlns="" domain="delegate" rights="none" pattern="HTTP"/><policy xmlns="" domain="path" rights="none" pattern="@*"/><policy xmlns="" domain="coder" rights="none" pattern="PS"/><policy xmlns="" domain="coder" rights="none" pattern="PS2"/><policy xmlns="" domain="coder" rights="none" pattern="PS3"/><policy xmlns="" domain="coder" rights="none" pattern="EPS"/><policy xmlns="" domain="coder" rights="read | write" pattern="PDF"/><policy xmlns="" domain="coder" rights="none" pattern="XPS"/></policymap>' > /etc/ImageMagick-6/policy.xml

WORKDIR /home/www/src/app

COPY --chown=1000:1000 apps/MLB-backend /home/www/src/app

RUN PATH=$PATH:/home/www/src/app/vendor/bin:bin

# RUN composer install --no-scripts --prefer-dist && rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"