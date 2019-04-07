## Setup Prometheus and Grafana monitoring in your Kubernetes cluster

### Create monitoring namespace

`kubectl create namespace monitoring`

### Setup prometheus

`kubectl apply -f prometheus.yaml`

### Replace appropriate values in `grafana.yaml` file as mentioned and also s3 details for grafana slack alerts with real-time image screenshots

### Setup grafana

`kubectl apply -f grafana.yaml`

### Login into grafana and import dasboard.json file and your are good to go!