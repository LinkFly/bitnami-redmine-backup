#!/bin/sh
cd "$(dirname "$0")"
. ./backup-restore.conf

backup_prefix=bitnami-redmine-backup
archive_file="${backup_prefix}_`date +%y-%m-%d_%H-%M-%S`.tar.gz"
backup_archive="$backup_dir/$archive_file"

cd "$installdir"
./ctlscript.sh stop
tar -czvf "$backup_archive" "$installdir"
./ctlscript.sh start
./del-old.sh "$backup_dir" $backup_max


