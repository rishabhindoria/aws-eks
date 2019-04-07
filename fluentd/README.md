## Fluentd Setup Kubernetes

### To setup fluentd add your AWS Elasticsearch url in the fluent.yaml file 

replace `<your aws elasticsearch url endpoint>` with your url

make sure to remove "https" from the AWS Elasticsearch url endpoint otherwise it won't work
also please don't change the port number to 9200 it should be over https port 443 only!

### Add your VPC NAT Gateway EIP (Elastic IP) to the elasticsearch domain policy

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Resource": [
        "arn:aws:es:us-east-1:xxxxxxxxxx:domain/xxxxxx-logs/*",
        "arn:aws:es:us-east-1:xxxxxxxx:domain/xxxxx-logs"
      ],
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
            "<YOUR EIP>"
          ]
        }
      }
    }
  ]
}
```

### Create namespace called monitoring

`kubectl create namespace monitoring`

### Then run this cmd to get fluentd daemon set up and running to send logs

`helm install stable/fluentd-elasticsearch -f fluent.yaml --namespace monitoring --name fluentd`