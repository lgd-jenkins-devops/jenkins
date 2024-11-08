#!/bin/bash

# Check if domain name is provided as a parameter
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

# Domain name passed as the first parameter
DOMAIN=$1

# Directory to store the generated certificate and key
CERTIFICATE_DIR="./certs"

# Create the directory to store certificates if it doesn't exist
mkdir -p "$CERTIFICATE_DIR"

# Generate the private key
echo "Generating the private key..."
openssl genpkey -algorithm RSA -out "$CERTIFICATE_DIR/$DOMAIN.key" -pkeyopt rsa_keygen_bits:2048

# Generate the self-signed SSL certificate (valid for 365 days)
echo "Generating the SSL certificate..."
openssl req -new -x509 -key "$CERTIFICATE_DIR/$DOMAIN.key" -out "$CERTIFICATE_DIR/$DOMAIN.crt" -days 365 -subj "/C=US/ST=California/L=San Francisco/O=My Company/CN=$DOMAIN"

echo "SSL certificate and private key generated:"
echo "Certificate: $CERTIFICATE_DIR/$DOMAIN.crt"
echo "Private Key: $CERTIFICATE_DIR/$DOMAIN.key"