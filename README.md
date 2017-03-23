# deploy-wordpress
Shell script to quickly install and pre-configure a blank WordPress site.

To test various dev versions of a Wordpress plugin we're building, we often need to create a new clean WordPress "sandbox" locally. Downloading, setting up and configuring WordPress each time could be laborious. This shell script automates this and saves our time. You can use it too, if you're developing a Wordpress plugin or theme.

What it does:
- Creates a new directory in your www directory
- Download and install the latest version of Wordpress to that directory
- Create and fill a new mysql database
- Pre-configure Wordpress
- Pre-install the plugins you need



## How to Install

### 1. Install WP-CLI.
WP-CLI is a command line interface to manage Wordpress sites installed locally. 

**How to install**: https://wp-cli.org/

**For MAMP users**: to make WP-CLI work well with MAMP, you will need to add two environment variables to your system. Follow these steps to do that

- Find the PHP version your MAMP installation is using. This command should help:

```bash
ls /Applications/MAMP/bin/php/ | sort -n | tail -1
```

- Add these export instructions to your shell profile file (located at ~/.zshrc if you use zsh, and ~/.bashrc for bash):

```bash
export PATH=/Applications/MAMP/bin/php/php5.5.10/bin:$PATH
export WP_CLI_PHP="/Applications/MAMP/bin/php/php5.5.10/bin/php"
```

Don't forget to replace `php5.5.10` with the PHP version you found on the previous step. 


### 2. Download the deploy_wordpress.sh script.
Save it to your computer or to the server where you're going to use it.


### 3. Make sure the fdile is executable.

``chmod 755 deploy_wordpress.sh``

### 4. Adjust the script to your local environment.
Open the script in a text editor and find the `"#Config"` block and adjust to your local setup

```bash
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
```

Here, `${1}` is a parameter you will pass to the command in your command line. It's a directory name where you want your new site to reside. 




## How to Use
Launch the script and pass the directory name you want your new Wordpress site to be placed at. 

``./deploy_wordpress wp_new_site``

This will create a directory in your web directory, deploy the latest version of Wordpress in it and configure it. 

