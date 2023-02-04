#!/bin/bash

echo "creating certificate:"
dotenv -e .env yarn create-certificate

echo "creating domain:"
yarn create-domain

echo "deploying api:"
serverless deploy

echo "post deploy:"
dotenv -e .env ./print-post-deploy-steps.sh