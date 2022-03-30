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
  - Search for "/home/ojn/" to find paths you may need to change to your setup (on mine, this folder is: /home/ojn/ojn_env)

# FIXME

- Remove binaries from utils/ folder
- Write build, setup, test and run documentations
- Cleanup paths
- Cleanup obsolete/legacy config values
- Remove hardcoded paths from OpenJabNab
