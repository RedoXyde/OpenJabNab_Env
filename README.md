Typical OpenJabNab environment and example configuration files

# Usage

Use this as a template to configure your own OJN instance.

Requirements:
  - Nginx  + PHP-FPM (see doc/configs/nginx and doc/config/php)
  - MariaDB (database, import doc/ojn.sql)
  - Crontab (cron setup, see doc/configs/crontab)
  - A mailserver
  - Qt 5 (build, Core Network Sql ...)
  - CMake (build)
  - catchsegv (run script ojn.sh)
  - pico2wave (TTS pico)
  - ffpmeg (TTS pico)
  - sox (plugin voicecommand)

You will also need tokens/API keys from online services:
  - Thunderforest
  - Ipgeolocation
  - Paypal ?

A lot of configuration is required:
  - Search for "YOUR_" strings in this folder to find out what needs to be replaced (API tokens, credentials, ... )
  - Search for "/PATH/TO/" or "/home/ojn/" to find paths you may need to change to your setup (on mine, this folder is: /home/ojn/ojn_env)

# Debian setup

    git submodule update --init

    sudo apt install --no-install-recommends mariadb-server nginx php-fpm php-apcu php-pear php-mail php-mail-mime php-mysql qttools5-dev libqt5sql5-mysql ffmpeg sox libttspico-utils libttspico-data build-essential cmake qtbase5-dev
    # Install missing packages, the list above is definitely not complete.

    ./build_ojn.sh

    sudo systemctl enable mariadb
    sudo systemctl start mariadb
    # Secure install, create user for OJN, import DB from doc/ojn.sql

    sudo cp doc/configs/php/fpm/pools.d/ojn.conf to /etc/php/7.4/fpm/pool.d/ojn.conf
    # Edit Path to OJN_env folder in ojn.conf
    sudo systemctl enable php7.4-fpm
    sudo systemctl start php7.4-fpm

    sudo cp doc/configs/nginx/* /etc/nginx/
    # Edit PATHs and DOMAIN in sites-enabled/ojn.conf
    sudo systemctl enable nginx
    sudo systemctl start nginx

    # Copy CRON rules from doc/config/crontab in "php/nginx server user" crontab, adjust PATHs
    sudo -u www-data crontab -e

    ./ojn.sh

    # Create a new user for yourself
      ## Using Web panel, register a new account
      ## Or using the Python client
        apiget('/accounts/registerNewAccount?login=YOUR_LOGIN&username=YOUR_USERNAME&pass=YOUR_PASSWORD')
        apiget('/accounts/saveAccounts')
    # Create another user for Cron jobs using the same process 
    # Create an automated admin user for admin tasks, using the same process, then make it admin
        apiget('/accounts/setadmin?user=YOUR_ADMIN_USER')
        apiget('/accounts/saveAccounts')
    # Edit http/config.php with newly created users credentials 

# FIXME

  - Find nabfiles sources, remove binaries from conf/nabfiles, add "autobuild" from sources
  - Remove binaries from utils/ folder
  - Write build, setup, test and run documentations
  - Cleanup paths
  - Cleanup obsolete/legacy config values
  - Remove hardcoded paths from OpenJabNab
