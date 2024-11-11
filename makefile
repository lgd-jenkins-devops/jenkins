# Define the path to the SSL certificate generation script
SCRIPT_DIR=scripts
CERT_SCRIPT=$(SCRIPT_DIR)/generate_ssl_certificate.sh

# Default domain for certificate generation
DOMAIN=test

# Target to generate the SSL certificate
generate-cert:
	@echo "Generating SSL certificate for $(DOMAIN)..."
	$(SCRIPT_DIR)/generate_ssl_certificate.sh $(DOMAIN)

# Clean generated certificates (optional)
clean:
	@echo "Cleaning up generated certificates..."
	rm -rf certs

# Backend

CONFIG_DIR := config
TEMPLATE_FILE := $(CONFIG_DIR)/bucket-template.j2
CONFIG_FILE := $(CONFIG_DIR)/deployment-config.yaml

DEPLOYMENT_NAME := jenkins-backend


deploy-backend:
	@gcloud deployment-manager deployments create $(DEPLOYMENT_NAME) --config $(CONFIG_FILE)

delete-deploy:
	@gcloud deployment-manager deployments delete $(DEPLOYMENT_NAME) --quiet