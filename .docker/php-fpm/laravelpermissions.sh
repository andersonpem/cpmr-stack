!#/bin/bash
path=/var/www/html
cd $path
sudo chown -R $APACHE_USER:$APACHE_GROUP .
sudo find $path -type f -exec chmod 644 {} \;
sudo find $path -type d -exec chmod 755 {} \;
sudo chgrp -R $APACHE_GROUP storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache