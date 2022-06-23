#!/usr/bin/env bash
# https://unix.stackexchange.com/questions/82598/how-do-i-write-a-retry-logic-in-script-to-keep-retrying-to-run-it-upto-5-times
secret=${db_user}
dump_name=dump_hs_sandbox_${source_db_name}.gz

PASSWORD=$(kubectl get -n $app_namespace secrets/${secret} \
    --template={{.data.password}} | base64 --decode)
USER=$(kubectl get -n $app_namespace secrets/${secret} \
    --template={{.data.user}} | base64 --decode)
URL=$(kubectl get -n $app_namespace secrets/${secret} \
    --template={{.data.connectionString}} | base64 --decode)
DB=$(echo $URL | cut -d/ -f4- | cut -d? -f-1)
kubectl port-forward -n ${db_namespace} \
    svc/${db_service} 27017:27017&

for i in $(seq 1 3)
do
    [ $i -gt 1 ] && echo "Recovered from an error, attempt #$i" && sleep 5
    mongorestore -u=${USER} -p=${PASSWORD} -d=${DB} \
        --archive=${dump_name} \
        --nsInclude="${source_db_name}.*" \
        --nsFrom="${source_db_name}.*" \
        --nsTo="${db_user}.*" \
        --gzip -v --drop \
        && s=0 && break || s=$?
done
(exit $s)
