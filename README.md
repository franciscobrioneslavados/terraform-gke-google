# GKE cluster with Terraform
##### Terraform v1.0.7 -- Medium Guide: [Guide](https://medium.com/geekculture/creating-gke-cluster-with-terraform-a96a8c3d6631)

### Enable APIS

```
sh enable_apis.sh
```

### Set environments

export GCP_PROJECT_ID=<project_id>
export SERVICE_ACCOUNT_NAME=<service_account_name>
export TF_BUCKET_NAME=<bucket_name>
export GCP_REGION=<region_name>
export GCP_ZONE=<zone_name>

### Create Service Account 
```
gcloud iam service-accounts create $(echo $SERVICE_ACCOUNT_NAME)
```

### Export JSON credentials
```
gcloud iam service-accounts keys create terraform-gkecluster-keyfile.json --iam-account=$(echo $SERVICE_ACCOUNT_NAME)@$(echo $GCP_PROJECT_ID).iam.gserviceaccount.com
```

### Terraform state in Google Cloud Storage

```
gsutil mb -p $(echo $GCP_PROJECT_ID) -c regional -l $(echo $GCP_REGION) gs://$(echo $TF_BUCKET_NAME)/
gsutil versioning set on gs://$(echo $TF_BUCKET_NAME)/
gsutil iam ch serviceAccount:$(echo $SERVICE_ACCOUNT_NAME)@$(echo $GCP_PROJECT_ID).iam.gserviceaccount.com:legacyBucketWriter gs://$(echo $TF_BUCKET_NAME)/
```

Terraform init

Terraform plan

terraform apply -auto-approve

$ gcloud container clusters list
$ gcloud container clusters get-credentials gke-cluster