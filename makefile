# Define the path to the SSL certificate generation script
SCRIPT_DIR=scripts
CERT_SCRIPT=$(SCRIPT_DIR)/generate_ssl_certificate.sh

# Default domain for certificate generation
DOMAIN=test.dev

# Target to generate the SSL certificate
generate-cert:
	@echo "Generating SSL certificate for $(DOMAIN)..."
	$(SCRIPT_DIR)/generate_ssl_certificate.sh $(DOMAIN)

# Clean generated certificates (optional)
clean:
	@echo "Cleaning up generated certificates..."
	rm -rf certs