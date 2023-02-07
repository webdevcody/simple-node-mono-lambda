# A Simple Mono Lambda using Serverless Framework

This is an example repo for how to deploy a mono repo express api onto AWS lambda + api gateway. This project works by taking your express code and wrapping it using serverless-http which parses the lambda events for us.

Deployments use the [serverless framework[(https://www.serverless.com/)] which uses cloudformation under the hood to provision and update your aws resources.

This project is setup to create a custom domain for your api endpoint; therefore, you'll need to setup a certificate in ACM prior to deploying.

## Notes

- This setup doesn't handle domains on route53. It assumes you're using an external domain management services such as google domains.

## Dependencies

- you need the [aws-cli installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- create IAM user and policies (admin permissions if you live dangerously) and run `aws configure` locally
- verify the following are on your env before deployment:
  - AWS_SECRET_ACCESS_KEY
  - AWS_ACCESS_KEY_ID
  - AWS_REGION
- `node18.x` is installed
- `yarn` is installed
- `jq` is installed
  - on mac: `brew install jq`
- run this command `cp .env.sample .env`
- modify the `.env` file with your desired domain and cert

## How to Run

1. `yarn`
2. `yarn dev`

## How to Deploy

1. `yarn deploy`
2. validate your domain by creating the required CNAME record on your domain DNS configuration
3. verify your deployment: `open https://<YOUR_DOMAIN>/status`
