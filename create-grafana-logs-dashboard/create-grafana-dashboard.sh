#!/usr/bin/env bash
jq --arg app_name "$app_name" \
  --arg expr "{cluster_name=\"${cluster_name}\",container=\"ppserver\",namespace=\"${app_namespace}\"}" \
  '.dashboard.panels[0].targets[0].expr = $expr
    | .dashboard.title = $app_name + "-logs"
    | .message = "Create " + $app_name + "-logs dashboard"' ${action_path}/ppserver-logs.json > ${app_name}.json

response=$(curl -XPOST -H "Authorization: Bearer ${grafana_api_key}" \
  -H "Content-Type: application/json" \
  -L https://humasandbox.grafana.net/api/dashboards/db \
  -d @./${app_name}.json)

echo "::set-output name=url::$(echo ${response} | jq -r '.url')"
echo "::set-output name=uid::$(echo ${response} | jq -r '.uid')"
