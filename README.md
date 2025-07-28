# Simple Python Web App

deployed through CI-CD pipeline (cloudbuild) to Google Kubernetes Engine (GKE)

```bash
# Buat Repositori Artifact Registry
gcloud artifacts repositories create python-web-app-repo --repository-format=docker --location=asia-southeast2 --description="Docker images for Python web app"
# output:
    # Create request issued for: [python-web-app-repo]
    # Waiting for operation [projects/primeval-rune-467212-t9/locations/asia-southeast2/operations/cec9213b-6b39-4e25-840b-b04d2e2faa90] to complete...done.
    # Created repository [python-web-app-repo].

# Berikan Izin Cloud Build:
PROJECT_ID=$(gcloud config get-value project)
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")
CLOUD_BUILD_SA="${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"

# Memberikan peran Artifact Registry Writer
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:${CLOUD_BUILD_SA}" \
    --role="roles/artifactregistry.writer"

# Memberikan peran Kubernetes Engine Developer
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:${CLOUD_BUILD_SA}" \
    --role="roles/container.developer"

# output:
    # Updated IAM policy for project [primeval-rune-467212-t9].
    # bindings:
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-artifactregistry.iam.gserviceaccount.com
    #   role: roles/artifactregistry.serviceAgent
    # - members:
    #   - serviceAccount:441501015598@cloudbuild.gserviceaccount.com
    #   - user:bostangsteiitb2020@gmail.com
    #   role: roles/artifactregistry.writer
    # - members:
    #   - serviceAccount:441501015598@cloudbuild.gserviceaccount.com
    #   role: roles/cloudbuild.builds.builder
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-cloudbuild.iam.gserviceaccount.com
    #   role: roles/cloudbuild.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@compute-system.iam.gserviceaccount.com
    #   role: roles/compute.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-gkenode.iam.gserviceaccount.com
    #   role: roles/container.defaultNodeServiceAgent
    # - members:
    #   - serviceAccount:service-441501015598@container-engine-robot.iam.gserviceaccount.com
    #   role: roles/container.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@containerregistry.iam.gserviceaccount.com
    #   role: roles/containerregistry.ServiceAgent
    # - members:
    #   - serviceAccount:441501015598-compute@developer.gserviceaccount.com
    #   - serviceAccount:441501015598@cloudservices.gserviceaccount.com
    #   role: roles/editor
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-networkconnectivity.iam.gserviceaccount.com
    #   role: roles/networkconnectivity.serviceAgent
    # - members:
    #   - user:bostangsteiitb2020@gmail.com
    #   role: roles/owner
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-pubsub.iam.gserviceaccount.com
    #   role: roles/pubsub.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@serverless-robot-prod.iam.gserviceaccount.com
    #   role: roles/run.serviceAgent
    # etag: BwY6-hx7dqA=
    # version: 1
    # Updated IAM policy for project [primeval-rune-467212-t9].
    # bindings:
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-artifactregistry.iam.gserviceaccount.com
    #   role: roles/artifactregistry.serviceAgent
    # - members:
    #   - serviceAccount:441501015598@cloudbuild.gserviceaccount.com
    #   - user:bostangsteiitb2020@gmail.com
    #   role: roles/artifactregistry.writer
    # - members:
    #   - serviceAccount:441501015598@cloudbuild.gserviceaccount.com
    #   role: roles/cloudbuild.builds.builder
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-cloudbuild.iam.gserviceaccount.com
    #   role: roles/cloudbuild.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@compute-system.iam.gserviceaccount.com
    #   role: roles/compute.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-gkenode.iam.gserviceaccount.com
    #   role: roles/container.defaultNodeServiceAgent
    # - members:
    #   - serviceAccount:441501015598@cloudbuild.gserviceaccount.com
    #   role: roles/container.developer
    # - members:
    #   - serviceAccount:service-441501015598@container-engine-robot.iam.gserviceaccount.com
    #   role: roles/container.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@containerregistry.iam.gserviceaccount.com
    #   role: roles/containerregistry.ServiceAgent
    # - members:
    #   - serviceAccount:441501015598-compute@developer.gserviceaccount.com
    #   - serviceAccount:441501015598@cloudservices.gserviceaccount.com
    #   role: roles/editor
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-networkconnectivity.iam.gserviceaccount.com
    #   role: roles/networkconnectivity.serviceAgent
    # - members:
    #   - user:bostangsteiitb2020@gmail.com
    #   role: roles/owner
    # - members:
    #   - serviceAccount:service-441501015598@gcp-sa-pubsub.iam.gserviceaccount.com
    #   role: roles/pubsub.serviceAgent
    # - members:
    #   - serviceAccount:service-441501015598@serverless-robot-prod.iam.gserviceaccount.com
    #   role: roles/run.serviceAgent
    # etag: BwY6-hyq9xE=
    # version: 1

# HUBUNGKAN Repositori git ke Cloud Build
    # Cloud Build > Triggers.

```
