This guide outlines the steps to deploy Jenkins infrastructure on Google Cloud Platform (GCP) using Terraform.

1. Clone the Repository
Start by cloning the repository to your local machine:

```bash
git clone https://github.com/repo
```

2. Navigate to the Jenkins Directory
Change to the jenkins directory, where the Terraform configuration files are located:

```bash
cd jenkins
```

3. Initialize Terraform
Run the following command to initialize the Terraform working directory. This will download necessary provider plugins and set up the backend:

```bash
terraform init
```

4. Validate the Deployment Plan
Next, validate the Terraform configuration by running the deployment plan script. This step will preview the infrastructure changes without applying them:

```bash
sh scripts/plan.sh
```

Check the output for any errors. If no errors are found and everything looks good, proceed to the next step.

5. Generate SSL Certificates (Optional)
If your deployment requires SSL certificates for secure communication, use the custom make script to generate the necessary certificate and key files:


```bash
make generate-cert
```
This will create the required SSL certificate and private key.

6. Apply the Terraform Configuration
Finally, apply the Terraform configuration to provision the infrastructure on GCP. This command will create and configure all the resources defined in your Terraform files:

```bash
sh scripts/apply.sh
7. Verify the Deployment
```

Once the deployment is complete, verify that Jenkins is up and running by checking the GCP console or by accessing the Jenkins server URL.

