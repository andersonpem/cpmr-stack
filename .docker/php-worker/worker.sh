#!/bin/bash
cd /var/www/html
echo "Starting the Listen worker"
php artisan queue:listen