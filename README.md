# Google Cloud Platform Final Project

---

### by Abdelrahman Mahmoud Mahmoud Anany

---

## Deploy helloworld python app on GKE cluster using multiple tools

---

### Tools Used

#### Docker :

- Dockerize the helloworld python application

#### Terraform :

- Provision the infrastructure as a code.

#### Google Container Registry :

- A private Docker registry running on Google Cloud Storage. It uses the same authentication, storage, and billing as google/docker-registry,

#### Kubernetes :

- Where we deploy helloworld app on it (GKE cluster).

#### Python :

- The hello world python application

---

### Build Docker image for the python app from the Dockerfile, and upload the image to gcr

- $ `docker build -t python-abdelrahman .`
- $ `docker tag python-abdelrahman gcr.io/imposing-ratio-319309/python-abdelrahman`
- $ `docker push gcr.io/imposing-ratio-319309/python-abdelrahman`

### Pull redis image from docker hub then push it to gcr

- $ `docker pull redis`
- $ `docker build -t gcr.io/imposing-ratio-319309/redis:latest .`
- $ `docker push gcr.io/imposing-ratio-319309/redis:latest`

### Install infrastructure with terraform

- $ `terraform init`
- $ `terraform plan`
- $ `terraform apply`

---

## SSH to the private VM:

### Setup credentials for docker to push to GCR using "service-account" Service Account

- $ `gcloud auth activate-service-account service-account --key-file=KEYFILE.json`
- $ `gcloud auth configure-docker`

### Install kubectl

- $ `sudo apt-get update`
- $ `sudo apt-get install kubectl`
- $ `sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin`

### authorize gcloud to access the Cloud Platform with Google user credentials

- $ `gcloud auth login`
- $ `gcloud auth application-default login`
- $ `gcloud conf set account <ACCOUNT>`

### SSH to GKE

- copy kubernetes directory
- $ `kubectl apply -f redis-deployment.yaml`
- $ `kubectl apply -f redis-service.yaml`
- $ `kubectl apply -f python-deployment.yaml`
- $ `kubectl apply -f loadbalancer.yaml`
- $ `kubectl get svc`

This deploys the following:

- Redis deployment and Exopse the deployment with ClusterIP service
- Demo App Deployment and Exopse it with loadbalancer service
