# Run locally, it should connect with public IP enabled on the Cloud SQL Instance. Stop working when public IP is taken off
mvn spring-boot:run \
  -Dspring-boot.run.jvmArguments="-Dspring.profiles.active=cloud"

# Build it with cloud build
gcloud builds submit --region=us-east4 --tag us-east4-docker.pkg.dev/$PROJECT_ID/quickstart-docker-repo/api-test-1:latest

# Run it as cloud run
gcloud run deploy apiserver-test1 \
    --image=us-east4-docker.pkg.dev/acn-highmark-health-odh/quickstart-docker-repo/api-test-1:latest  \
    --platform managed \
    --project=$PROJECT_ID \
    --region=us-east4 \
    --set-env-vars "spring.cloud.gcp.sql.instance-connection-name=$PROJECT_ID:us-east4:binu-pg13" \
    --set-env-vars "spring.cloud.gcp.sql.database-name=test-db"
