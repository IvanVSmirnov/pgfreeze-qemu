#!/bin/sh

# Default values
PGUSER="postgres"
LABEL="pgfreeze"
STARTASAP=1

[ -r /etc/default/pgfreeze ] && . /etc/default/pgfreeze

case "$1" in
freeze)
	if [ "$STARTASAP" -eq 1 ]; then
		SQL="SELECT pg_start_backup('${LABEL}', true);"
	else
		SQL="SELECT pg_start_backup('${LABEL}');"
	fi
	
	su -c "echo \"$SQL\" | psql" - ${PGUSER}
	logger "Postgres has been freezed for backup"
	;;
thaw)
	SQL="SELECT * FROM pg_stop_backup();"
	su -c "echo \"$SQL\" | psql" - ${PGUSER}
	logger "Postgress has been unfrezed"
        ;;
*)
	echo "Usage: ./pgfreeze.sh (freeze|thaw)"
        exit 1
        ;;
esac
exit 0
