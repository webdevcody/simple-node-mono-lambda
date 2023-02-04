#!/bin/bash

# Check if the certificate already exists
CERTIFICATE_ARN=$(aws acm list-certificates | jq -r ".CertificateSummaryList[] | select(.DomainName==\"$DOMAIN_NAME\") | .CertificateArn")

if [ -z "$CERTIFICATE_ARN" ]; then
  echo "Creating certificate for domain $CERT_NAME"

  # Request a new certificate
  CERTIFICATE_ARN=$(aws acm request-certificate --domain-name "$CERT_NAME" --validation-method DNS | jq -r .CertificateArn)

  echo "Certificate ARN: $CERTIFICATE_ARN"
fi

# Check if the certificate is validated
CERTIFICATE_STATUS=$(aws acm describe-certificate --certificate-arn "$CERTIFICATE_ARN" | jq -r ".Certificate.Status")

if [ "$CERTIFICATE_STATUS" != "ISSUED" ]; then
  # Get the validation record to add to the DNS
  VALIDATION_RECORD=$(aws acm describe-certificate --certificate-arn "$CERTIFICATE_ARN" | jq -r ".Certificate.DomainValidationOptions[] | select(.DomainName==\"$CERT_NAME\") | .ResourceRecord")
  echo "Please add the following CNAME record to your DNS:"
  echo "$VALIDATION_RECORD"

  # Wait for the certificate to be validated
  echo "Waiting for you certificate to validate"

  aws acm wait certificate-validated --certificate-arn "$CERTIFICATE_ARN"
  echo "Certificate is validated"
fi

