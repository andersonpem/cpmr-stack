#!/bin/bash
cd /var/www/html
echo "Starting the Worker"
php artisan queue:work