#!/bin/sh

echo "feeding config to OCP"

for file in \
secret-kv.yml \
secret-possu.yml \
secret-exposure-notification-github-webhook.yml \
secret-publish-token-github-webhook.yml \
secret-exposure-notification-generic-webhook.yml \
secret-publish-token-generic-webhook.yml \
bc-exposure-notification.yml \
bc-publish-token.yml \
is-exposure-notification.yml \
is-publish-token.yml \
dc-possu.yml \
dc-exposure-notification.yml \
dc-publish-token.yml \
service-exposure-notification.yml \
service-possu.yml \
service-publish-token.yml \
route-exposure-notification.yml \
route-publish-token.yml \
; do
  oc create -f $file
done
