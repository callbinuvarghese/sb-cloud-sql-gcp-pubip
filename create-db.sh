#https://spring-gcp.saturnism.me/app-dev/cloud-services/databases/cloud-sql

gcloud sql instances create $DB_INSTANCE_NAME \
    --project=$PROJECT_ID \
    --network=projects/$PROJECT_ID/global/networks/default \
    --database-version=POSTGRES_14 \
    --cpu=2 \
    --memory=4GB \
    --region=$REGION \
    --root-password=${DB_INSTANCE_PASSWORD}

gcloud sql databases create messages --instance guestbook
gcloud sql instances patch  $DB_INSTANCE_NAME --authorized-networks $MY_PUBLIC_IP

gcloud sql connect guestbook
Allowlisting your IP for incoming connection for 5 minutes...done.
Connecting to database with SQL user [postgres].Password: ${DB_INSTANCE_PASSWORD}
\l
\c messages
You are now connected to database "messages" as user "postgres".
\dt
CREATE TABLE guestbook_message (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  message VARCHAR(255),
  image_uri VARCHAR(255)
);
\dt
messages=> select * from guestbook_message;
\q

gcloud sql instances patch $DB_INSTANCE_NAME --no-assign-ip