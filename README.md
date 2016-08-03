# MySQL MariaDB Backup Routine Bash Script
A bash file to be implemented as a cron job to backup your MySQL or MariaDB database.

# Usage
First of all open de file and cofig:

backup_path="/desired/folder<br/>"<br/>
user="YOUR DB USER"
password="YOUR DB PASSWORD"<br/><br/>
host="YOUR HOST ADDRESS"
db_name="YOUR DB NAME"<br/>
keep_days=3
* keep_days is the amount of days that the script will keep files. (Default last 3 days)<br/>
