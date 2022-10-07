#!/usr/bin/env bash

GITLAB_HOST=https://gitlab.aws.ciscops.net

while IFS=, read -r NAME PASSWORD TOKEN; do
    curl --request DELETE -sSLk --header "PRIVATE-TOKEN:$TOKEN" "$GITLAB_HOST/api/v4/projects/$NAME%2fmdd"
done < podvars
