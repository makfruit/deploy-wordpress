#!/bin/bash

#
# Shell script to deploy amd pre-configure a blank Wordpress site in a local directory
#

#
# Requirements:
# - wp-cli must be installed and aliased as 'wp'. See https://make.wordpress.org/cli/handbook/installing/
#


#
# Parameters
#
# 1 - directory name for the new Worsdpress site
#


#
# Config
#
www_dir="~/www"
new_wp_dir=${1}
new_site_url="http://localhost/${new_wp_dir}"

dbname=${1}
dbuser="user"
dbpass="password"

wpuser="admin"
wppassword="password"
wpemail="admin@example.com"

sitename=${1}
plugins_to_install="ecwid-shopping-cart google-sitemap-generator wordpress-seo"



# Validate arguments
if [ -z ${new_wp_dir} ]; then
    echo "> ERROR: provide new wp dir name as an argument"
    exit 1
fi


# Download latest Wordpress
cd ~/www
wp core download --path=${new_wp_dir}


# Install and configure Wordpress
cd ${new_wp_dir}
wp core config --dbname=${dbname} --dbuser=${dbuser} --dbpass=${dbpass} --extra-php <<PHP
define('WP_DEBUG', true );
define('WP_DEBUG_LOG', true );
PHP

wp db reset --yes
wp core install --url="${new_site_url}" --title="${sitename}" --admin_user=${wpuser} --admin_password=${wppassword} --admin_email=${wpemail}
wp rewrite structure '/%postname%/'

# Install plugins
wp plugin install ${plugins_to_install} --activate

# Echo results and open site admin backend
echo "New WordPress site installed at ${new_site_url}"
open "${new_site_url}/wp-admin"
cd -
