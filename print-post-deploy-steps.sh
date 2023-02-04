#!/bin/bash

# Get the target domain name for the custom domain
TARGET_DOMAIN_NAME=$(aws apigateway get-domain-name --domain-name "$DOMAIN_NAME" | jq -r ".regionalDomainName")

echo ""
echo "Please add the following CNAME record to your DNS:"
echo ""
echo "    name=$DOMAIN_NAME"
echo "    type=CNAME"
echo "    value=$TARGET_DOMAIN_NAME"
echo ""
echo ""
