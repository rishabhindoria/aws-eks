## VPN Setup Kubernetes

### Create namespace called vpn

`kubectl create namespace vpn`

### Create ebs volume for vpn

`kubectl apply -f openvpn-pv-claim.yaml`

### Then run this cmd to get vpn set up and running

`helm install stable/openvpn -f openvpn.yaml --namespace vpn --name openvpn`

### Then follow instructions in the output of above cmd to download vpn file