#!/bin/bash
if [ `date +%H%M` == "0000" ]; then
        sleep 1
        LOCK=`lsof /var/www/graph.png; echo $?`
        while [ "$LOCK" -ne 1 ]; do
                LOCK=`lsof /var/www/graph.png; echo $?`
                sleep 1
        done
        mutt -s "`date +%F` temp data" EMAIL@DOMAIN.COM -a "/var/www/graph.png" < /etc/motd
        echo > /run/shm/temp.html
        echo > /run/shm/sent
fi
chown www-data /run/shm/temp.html
TEMP=`php /var/www/current.php`
echo "`date`  $TEMP <br>" >> /run/shm/temp.html

