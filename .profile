db_proto="$(echo $DATABASE_URL | grep :// | sed -e's,^\(.*://\).*,\1,g')"
db_url=$(echo $DATABASE_URL | sed -e s,$db_proto,,g)
db_user_pw="$(echo $db_url | grep @ | cut -d@ -f1)"
db_user="$(echo $db_user_pw | cut -d: -f1)"
db_pw="$(echo $db_user_pw | cut -d: -f2)"
db_hostport=$(echo $db_url | sed -e s,$db_user_pw@,,g | cut -d/ -f1)
db_host="$(echo $db_hostport | sed -e 's,:.*,,g')"
db_port="$(echo $db_hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
db_path="$(echo $db_url | grep / | cut -d/ -f2-)"

export para_dao="SqlDAO"
export para_sql_driver="org.postgresql.Driver"
export para_sql_url="postgresql://$db_host:$db_port/$db_path"
export para_sql_user=$db_user
export para_sql_password=$db_pw

es_proto="$(echo $BONSAI_URL | grep :// | sed -e's,^\(.*://\).*,\1,g')"
es_url=$(echo $BONSAI_URL | sed -e s,$es_proto,,g)
es_user_pw="$(echo $es_url | grep @ | cut -d@ -f1)"
es_user="$(echo $es_user_pw | cut -d: -f1)"
es_pw="$(echo $es_user_pw | cut -d: -f2)"
es_hostport=$(echo $es_url | sed -e s,$es_user_pw@,,g | cut -d/ -f1)
es_host="$(echo $es_hostport | sed -e 's,:.*,,g')"
es_port="$(echo $es_hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
es_path="$(echo $es_url | grep / | cut -d/ -f2-)"

export para_search="ElasticSearch"
export para_es_basic_auth_login=$es_user
export para_es_basic_auth_password=$es_pw
export para_es_restclient_host=$es_host
export para_es_restclient_port=$es_port

