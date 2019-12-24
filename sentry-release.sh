#!/bin/bash
curl https://sentry.io/api/0/organizations/$SENTRY_ORG/releases/ \
  -X POST \
  -H "Authorization: Bearer $SENTRY_AUTH_TOKEN" \
  -H 'Content-Type: application/json' \
  -d '
 {
 "version": "'$CI_COMMIT_SHORT_SHA'",
 "projects":["order-v2"],
 "commits":[
     {
        "repository": "'$CI_PROJECT_URL'",
        "commit":"'$CI_COMMIT_SHA'",
        "id":"'$CI_COMMIT_SHA'",
        "message": "'$CI_COMMIT_MESSAGE'",
        "author": "'$GITLAB_USER_LOGIN'",
        "previousCommit":"'$CI_COMMIT_BEFORE_SHA'"
    }
 ]
 }
 '
