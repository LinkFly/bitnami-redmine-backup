#!/bin/sh
cd "$(dirname "$0")"
. ./backup-restore.conf

backup_file="$1"
rm -rf "${installdir}__"
cd "${installdir}"
./ctlscript.sh stop
mv -f "${installdir}_" "${installdir}__"
mv "${installdir}" "${installdir}_"
cd /
tar -xzvf "${backup_file}" 
cd "${installdir}"
./ctlscript.sh start
