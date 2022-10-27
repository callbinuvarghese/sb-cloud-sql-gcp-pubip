export DB_INSTANCE_NAME=guestbook
export DB_INSTANCE_PASSWORD=binu123
export MY_PUBLIC_IP=$(curl ifconfig.me)
export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export PROJECT_NAME=$(gcloud projects describe $PROJECT_ID --format='value(name)')
export REGION=us-east4
