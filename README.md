# import-gtfs-to-mysql
Shell script to import gtfs.txt files to mysql database

## Usage
- Create a mysql database if it doesn't exist already  
`mysql -u (my_db_username) -p -e 'CREATE DATABASE (my_db_name)'`
- Create gtfs folder 
- Add gtfs .txt files in gtfs folder  
- Run the script:  
`sh import-gtfs-mysql.sh`
- When prompted enter database name, username, and password

## Example
```
mkdir gtfs && cd gtfs

wget http://link/to/gtfs.zip

unzip gtfs.zip

mysql -u root -p -e 'CREATE DATABASE gtfs'

sh import-gtfs-mysql.sh

enter database name:
gtfs
enter database username:
root
Enter password: 
import successful
```
