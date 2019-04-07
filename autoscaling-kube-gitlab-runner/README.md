## Setup Kubernetes Autoscaling Gitlab runner

### Create gitlab namespace

`kubectl create namespace gitlab`

### Create kubernetes secret containing AWS Access Key and Secret key to allow gitlab runner s3 access to upload build cache

`kubectl create secret -n gitlab generic s3access --from-literal=accesskey="" --from-literal=secretkey=""`

### Replace appropriate values in yaml file as mentioned

### Then run these cmds to install gitlab runner

`helm repo add gitlab https://charts.gitlab.io`
`helm install --namespace gitlab --name gitlab-runner -f gitlab-runner.yaml gitlab/gitlab-runner`

```
https://docs.gitlab.com/ee/install/kubernetes/gitlab_runner_chart.html
```