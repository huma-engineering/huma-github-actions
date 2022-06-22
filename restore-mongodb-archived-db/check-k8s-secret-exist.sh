#!/usr/bin/env bash
for i in $(seq 1 60)
do
    [ $i -gt 1 ] && echo "not found secret $1/$2, attempt #$i" && sleep 3
    SECRET=$(kubectl get -n $2 secrets/$1 -o name --ignore-not-found) \
        && [ -n "${SECRET}" ] && s=0 && break || s=1
done
(exit $s)
