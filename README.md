# sb-cloud-sql-gcp-pubip

### This project use spring-cloud-gcp-starter-sql-postgresql of spring-cloud-dependencies to connect to Postgres on GCP Cloud SQL with connection name. The Cloud SQL instance should have public ip enabled for this to work. Enabling public IP is a security concern for Cloud SQL. So this should not be used for corporate environments.

### This project is a spring boot data JPA API Service returning HATEOS results for the REST API requests.

### It is configured to use Postgres and it can also be used to use mySQL with slight changes

### This is inspired from https://spring-gcp.saturnism.me/app-dev/cloud-services/databases/cloud-sql

### It is part of their collection of GCP services https://github.com/saturnism/spring-cloud-gcp-guestbook. I recommend to go and refer their repo for any details. It is meant to be a personal quick reference for me to that project. 
