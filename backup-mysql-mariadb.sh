#!/bin/bash

#If any error occur exit bash script.
set -e

# Scope vars
declare backup_path="YOUR BACKUP DIR"
declare user="YOUR DB USER"
declare password="YOUR DB PASSWORD"
declare host="YOUR HOST ADDRESS"
declare db_name="YOUR DB NAME"
declare -i Keep_days=3
declare -i sleep_seconds=2
declare date=$(date +"%Y-%m-%d")
declare -a tables_truncate_after_dump=()

# Other options
echo "$(tput setaf 7)$(tput setab 4)"
echo "==========================================================" 
echo "# BEGINNING backup-mariadb.sh [$date]" 
echo "# DEVELOPED BY Leandro Curioso <leandro.curioso@gmail.com>"
echo "# TOTAL OF 5 STEPS"

echo "1 - Creating $backup_path dir..."
sudo mkdir -p $backup_path
sudo chmod 757 $backup_path

# Dump database into SQL file
echo "2 - Dumping $db_name database..."
sudo mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql
sleep $sleep_seconds

# Delete files older than $Keep_days
echo "3 - Deleting backups older than $Keep_days days."
sudo find $backup_path -mtime +$Keep_days -exec rm {} \;

echo "4 - Truncating tables.."

sleep $sleep_seconds

for i in "${tables_truncate_after_dump[@]}"
do
   echo "     * Truncating table $db_name."$i""
   mysql -h $host -u $user --password=$password --database=$db_name -e "TRUNCATE TABLE $db_name."$i""
   sleep $sleep_seconds
done
echo "5 - DONE!"

echo "# ENDING backup-mariadb.sh"
echo "==========================================================" 
echo "$(tput sgr0)"








