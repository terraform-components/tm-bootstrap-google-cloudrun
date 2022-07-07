all:
	terramate list
	terramate generate
	terramate run -- terraform init
	terramate run -- terraform plan

changed:
	terramate list
	terramate generate
	terramate run --changed terraform init
	terramate run --changed terraform plan

init-all:
	terramate list
	terramate run -- terraform init

plan-all:
	terramate list
	terramate run -- terraform plan

apply-all:
	terramate list
	terramate run -- terraform apply

format: 
	terraform fmt -recursive -diff -write=true

#####

login:
	gcloud auth login
	gcloud auth application-default login

docker-configure:
  # https://cloud.google.com/artifact-registry/docs/docker/authentication#gcloud-helper
	gcloud auth configure-docker europe-docker.pkg.dev

# remove all terragrunt caches. CAUTION.
clean-cache:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;

log-settings:
	gcloud alpha logging settings update --organization=$(TF_VAR_org_id) --storage-location=europe-west3