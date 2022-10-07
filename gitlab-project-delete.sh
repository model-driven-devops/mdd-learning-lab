#!/usr/bin/env bash

curl --request DELETE -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT"
