#!/bin/sh

read -r JSON

echo "Consul watch request:"

echo $JSON

JENKINS_URL="localhost"
JOB_NAME=""
STATUS_ARRAY=$(echo "$JSON" | jq -r ".[].Status")
CHECK_ID_ARRAY=$(echo "$JSON" | jq -r ".[].CheckID")

i=0

for STATUS in $STATUS_ARRAY
do
  CHECK_ID=${CHECK_ID_ARRAY[$i]}
  printf "Status: %s, ID: %s\n" $STATUS $CHECK_ID
  curl -X POST -u consul:consul http://$JENKINS_URL:8080/job/$JOB_NAME/build
  i=$((i+1))
done

### Consul output example
#[
#  {
#    "Node": "jenkins",
#    "CheckID": "memory",
#    "Name": "Memory consumption",
#    "Status": "warning",
#    "Notes": "Critical = 95%, Warning = 80%",
#    "Output": "Memory Usage: 94%",
#    "ServiceID": "",
#    "ServiceName": "",
#    "ServiceTags": []
#  }
#]
