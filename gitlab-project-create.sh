#!/usr/bin/env bash

# Uncomment the following and define proper values (or specify as environment variables)
GITLAB_HOST=http://devtools-gitlab.lab.devnetsandbox.local
GITLAB_PROJECT=mdd
GITLAB_USERNAME=developer
GITLAB_PASSWORD=C1sco12345

# Create the project
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "$GITLAB_HOST/api/v4/projects" --form "name=$GITLAB_PROJECT"
# Add CI vars
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "$GITLAB_HOST/api/v4/projects/$GITLAB_NAME/$GITLAB_PROJECT/variables" --form "key=CML_HOST" --form "value=$CML_HOST" 
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "$GITLAB_HOST/api/v4/projects/$GITLAB_NAME/$GITLAB_PROJECT/variables" --form "key=CML_USERNAME" --form "value=$CML_USERNAME" 
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "$GITLAB_HOST/api/v4/projects/$GITLAB_NAME/$GITLAB_PROJECT/variables" --form "key=CML_PASSWORD" --form "value=$CML_PASSWORD" 
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "$GITLAB_HOST/api/v4/projects/$GITLAB_NAME/$GITLAB_PROJECT/variables" --form "key=CML_LAB" --form "value=$GITLAB_NAME$CML_LAB_SUFFIX"
curl --request POST -sSLk --header "PRIVATE-TOKEN:$GITLAB_TOKEN" "$GITLAB_HOST/api/v4/projects/$GITLAB_NAME/$GITLAB_PROJECT/variables" --form "key=CML_VERIFY_CERT" --form "value=false"
# Push repo into project
git push https://$GITLAB_USERNAME:$GITLAB_PASSWORD@$GITLAB_HOST/$GITLAB_USERNAME/$GITLAB_PROJECT

# Remove mdd directory
# cd ..
# rm -rf mdd
