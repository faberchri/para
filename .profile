db_proto="$(echo $DATABASE_URL | grep :// | sed -e's,^\(.*://\).*,\1,g')"
db_url=$(echo $DATABASE_URL | sed -e s,$db_proto,,g)
db_user_pw="$(echo $db_url | grep @ | cut -d@ -f1)"
db_user="$(echo $user_pw | cut -d: -f1)"
db_pw="$(echo $user_pw | cut -d: -f2)"
db_hostport=$(echo $db_url | sed -e s,$db_user_pw@,,g | cut -d/ -f1)
db_host="$(echo $db_hostport | sed -e 's,:.*,,g')"
db_port="$(echo $db_hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
db_path="$(echo $db_url | grep / | cut -d/ -f2-)"

echo "fachri - In .profile db_user: $db_user"
export para_sql_driver="org.postgresql.Driver"
export para_sql_url="postgresql://$db_host:$db_port/$db_path"
echo "fachri - In .profile para_sql_url: $para_sql_url"
export para_sql_user=$db_user
echo "fachri - In .profile para_sql_user: $para_sql_user"
export para_sql_password=$db_pw
