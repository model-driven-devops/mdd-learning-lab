#!/usr/bin/env bash

# Create the project
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects" --form "name=$GITLAB_PROJECT"
# Add CI vars
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=CML_HOST" --form "value=$CML_HOST" 
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=CML_USERNAME" --form "value=$CML_USERNAME" 
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=CML_PASSWORD" --form "value=$CML_PASSWORD" 
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=CML_LAB" --form "value=$CML_LAB"
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=CML_VERIFY_CERT" --form "value=false"
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=NETBOX_API" --form "value=$NETBOX_API"
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=NETBOX_TOKEN" --form "value=$NETBOX_TOKEN"
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=NSO_USERNAME" --form "value=$NSO_USERNAME"
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "http://$GITLAB_HOST/api/v4/projects/$GITLAB_USERNAME%2f$GITLAB_PROJECT/variables" --form "key=NSO_PASSWORD" --form "value=$NSO_PASSWORD"
# Push repo into project
git push http://$GITLAB_USERNAME:$GITLAB_PASSWORD@$GITLAB_HOST/$GITLAB_USERNAME/$GITLAB_PROJECT
