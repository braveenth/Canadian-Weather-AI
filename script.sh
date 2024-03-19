#! /bin/bash

echo "Running Script"
gcloud config set project brave-projects
gcloud auth configure-docker us-central1-docker.pkg.dev
docker build --platform linux/amd64 -t canadian-weather-ai .
docker tag canadian-weather-ai us-central1-docker.pkg.dev/brave-projects/brave-projects/canadian-weather-ai
docker push us-central1-docker.pkg.dev/brave-projects/brave-projects/canadian-weather-ai
gcloud run jobs replace job.yaml
echo "Done"