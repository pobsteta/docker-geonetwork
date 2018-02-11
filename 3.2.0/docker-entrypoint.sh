#!/bin/bash
set -e

if [ "$1" = 'catalina.sh' ]; then

	mkdir -p "$DATA_DIR"

	#Set geonetwork data dir
	export CATALINA_OPTS="$CATALINA_OPTS -Dgeonetwork.dir=$DATA_DIR"
	
	#Fixing the xml API authorization
	sed -i -e 's#param name="skipInfo" value="y"#param name="skipInfo" value="n"#g' $CATALINA_HOME/webapps/geonetwork/WEB-INF/config/config-service-xml-api.xml
fi

exec "$@"
