#!/bin/bash
echo enter database name:
read dbname
echo enter database username:
read username
(cat creator2.sql | mysql -u $username $dbname -p --local-infile && echo import successful) || echo import failed
