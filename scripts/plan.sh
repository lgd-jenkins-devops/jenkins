#!/bin/bash

# Get the current project ID
PROJECT_ID=$(gcloud config get-value project)

# Check if the project ID was obtained
if [ -z "$PROJECT_ID" ]; then
  echo "Could not retrieve the project ID. Make sure you have a project set up in gcloud."
  exit 1
fi

# Get the default region (if not set, use a default one)
REGION=$(gcloud config get-value compute/region)

if [ -z "$REGION" ]; then
  echo "No region is set. Using the default region: us-central1"
  REGION="us-central1"  # Default region
fi

# Display the values
echo "Project ID: $PROJECT_ID"
echo "Region: $REGION"

# Run terraform init and pass the variables to it
terraform plan \
  -var "project_id=$PROJECT_ID" \ 
  -var "region=$REGION" \ 
  -var-file="var/terraform.tfvars"