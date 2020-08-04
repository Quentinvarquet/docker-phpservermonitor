#!/usr/bin/env bash

set -Eeuo pipefail

cat > config.php <<EOL
<?php
define('PSM_DB_HOST', '${DATABASE_HOST:=mysql}');
define('PSM_DB_PORT', '${DATABASE_PORT:=3306}');
define('PSM_DB_NAME', '${DATABASE_NAME:=psm}');
define('PSM_DB_USER', '${DATABASE_USER:=psm}');
define('PSM_DB_PASS', '${DATABASE_PASSWORD}');
define('PSM_DB_PREFIX', '${DATABASE_PREFIX:-psm}_');
define('PSM_BASE_URL', '${BASE_URL}');
define('PSM_DEBUG', ${DEBUG:-false});
EOL

touch /var/log/cron.log;
(crontab -l 2>/dev/null; echo "*/${CHECK_INTERVAL:=2} * * * * date >> /var/log/cron.log") | crontab -; \
(crontab -l 2>/dev/null; echo "*/${CHECK_INTERVAL} * * * * $(which php) /var/www/html/cron/status.cron.php --timeout=${TIMEOUT:-10}") | crontab -

service cron start
exec /usr/sbin/apache2ctl -D FOREGROUND
