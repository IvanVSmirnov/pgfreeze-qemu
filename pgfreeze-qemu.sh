#!/bin/sh
SELFNAME="pgfreeze-qemu"

# Default values
PGUSER="postgres"
LABEL="pgfreeze-qemu"
IMMEDIATE=0

# Override default values by user customized parameters
[ -r /etc/default/pgfreeze-qemu ] && . /etc/default/pgfreeze-qemu

case "$1" in
freeze)
	if [ "$STARTASAP" -eq 1 ]; then
		SQL="SELECT pg_start_backup('${LABEL}', true);"
	else
		SQL="SELECT pg_start_backup('${LABEL}');"
	fi
	
	su -c "echo \"$SQL\" | psql" - ${PGUSER}
	logger --tag ${SELFNAME}  "Postgres RDBMS has been freezed for backup"
	;;
thaw)
	SQL="SELECT * FROM pg_stop_backup();"
	su -c "echo \"$SQL\" | psql" - ${PGUSER}
	logger --tag ${SELFNAME} "Postgress has been unfrezed"
        ;;
*)
	echo "Usage: ./pgfreeze.sh (freeze|thaw)"
        exit 1
        ;;
esac
exit 0
