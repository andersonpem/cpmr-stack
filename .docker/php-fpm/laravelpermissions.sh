#!/usr/bin/env bash
path=/var/www/html
cd $path
echo "Changing owner to $APACHE_RUN_USER:$APACHE_RUN_GROUP"
sudo chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP .
echo "Changing permissions for files and folders"
sudo find $path -type f -exec chmod 644 {} \;
sudo find $path -type d -exec chmod 755 {} \;
echo "Changing permissions for write-enabled directories..."
sudo chgrp -R $APACHE_RUN_GROUP storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
echo "You're good to go."