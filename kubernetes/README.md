# Super quick Snyk k8s monitor install.

## Pre-requisities:
- Having `helm` and `tilt` installed


This script is taking care of all of this, and will install the missing elements

## Installation
- Add your Snyk Kubernetes integration token (generated in Snyk) into the `snyk-monitor-secret.yaml` file. *You need to base64 encode it first (google ‘base64 encoder’)*
- Run the `setup.sh` script
- Wait for Tilt to install everything
- Stop tilt
- Enjoy


Snyk for K8s is actually installed with the following command
```bash
helm upgrade --install snyk-monitor snyk-charts/snyk-monitor --namespace snyk-monitor --set clusterName="Production cluster"
```

## Checks:

Once Kubernetes is configured and running, you can run you can run kubectl proxy your Terminal and the access Goof demo app in your browser at the following URL: [http://localhost:3001](http://localhost:3001). This is an app used for Stranger Danger sessions. You can find some of the exercises and exploits for it here: [Click me](https://github.com/snyk/exploit-workshop/blob/master/README.md)


- go to [http://localhost:3001](http://localhost:3001/) to check that goof todo is up and running
- Check the tilt console
- Snyk might take a few minutes to load your cluster

## Accessing the dashboard:
```bash
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-sa | awk '{print $1}')
```
for having your token and visit [http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/)
