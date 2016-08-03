# MySQL MariaDB Backup Routine Bash Script
A bash script to be implemented as a cron job to backup your MySQL or MariaDB database.

# Usage
First of all open the file and config:

backup_path="/backup/destination/folder"<br/>

user="YOUR DB USER"<br/>

password="YOUR DB PASSWORD"<br/>

host="YOUR HOST ADDRESS"<br/>

db_name="YOUR DB NAME"<br/>

keep_days=3
* keep_days is the amount of days that the script will keep files. (Default last 3 days files)

tables_truncate_after_dump
* It's an array of tables that will be truncated after the dump. Can be used if you want to truncate a log table. Do not split with comma use only white space. Example tables_truncate_after_dump("table1" "table2")

# Add Permission
Be sure to give the correct permission to execute the bash with:

```bash
sudo chmod 700 /path/to/backup-mysql-mariadb.sh
```

# Add Bash as Cron Job
```bash
crontab -e
00 20 * * * /path/to/backup-mysql-mariadb.sh
```
In this case it’ll run every day at 8 PM.

# Questions?
Leandro Curioso <leandro.curioso@gmail.com>
