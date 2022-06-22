#!/usr/bin/env bash
for i in $(seq 1 60)
do
    [ $i -gt 1 ] && echo "not found pods like $1/$2, attempt #$i" && sleep 3
    PODS=$(kubectl get pods -n $2 \
        --field-selector=status.phase=Running -o name \
        | grep $1 -c) \
        && [ "${PODS}" -gt 0 ] && s=0 && break || s=1
done
(exit $s)
