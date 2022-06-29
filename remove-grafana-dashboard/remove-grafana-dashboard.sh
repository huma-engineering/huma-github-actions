#!/usr/bin/env bash

dashboards=$(curl -sS -XGET -H "Authorization: Bearer ${grafana_api_key}" \
  -H "Content-Type: application/json" \
  -L "${grafana_host}/api/search?query=${title}")
uid=$(echo ${dashboards} | jq -r '.[0].uid')

response=$(curl -sS -XDELETE -H "Authorization: Bearer ${grafana_api_key}" \
  -H "Content-Type: application/json" \
  -L "${grafana_host}/api/dashboards/uid/${uid}")
echo "::set-output name=response::$(echo ${response} | jq -r '.message')"
