#!/bin/sh -eu

case "$1" in
	serve)
		chown -R synapse:synapse /data
		su-exec synapse python -m synapse.app.homeserver \
			-c /data/homeserver.yaml
		;;
	generate)
		chown -R synapse:synapse /data
		cd /data
		su-exec synapse python -m synapse.app.homeserver \
			--generate-config \
			--config-path /data/homeserver.yaml \
			--report-stats yes \
			--server-name "${SERVERNAME}"
		;;
	*)
		exec "$@"
		;;
esac
