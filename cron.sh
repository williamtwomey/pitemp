#!/bin/bash

#Run this in cron every minute. This could definitly be cleaned up, just a quick and dirty hack.

if [ `date +%H%M` == "0000" ]; then
        echo > /var/www/temp.html
fi
TEMP=`php /var/www/current.php`
echo "`date`  $TEMP <br>" >> /var/www/temp.html
