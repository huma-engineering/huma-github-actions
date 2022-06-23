#!/usr/bin/env bash
for i in $(seq 1 60)
do
    [ $i -gt 1 ] && echo "not found secret ${secret_name}/${namespace}, attempt #$i" && sleep 3
    SECRET=$(kubectl get -n ${namespace} secrets/${secret_name} -o name --ignore-not-found) \
        && [ -n "${SECRET}" ] && s=0 && break || s=1
done
(exit $s)
