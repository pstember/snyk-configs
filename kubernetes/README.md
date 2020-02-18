# Super quick Snyk k8s monitor install.

## Pre-requisities:
- Having the `snyk-monitoring` namespace
- Having an application/deploymebt to scan
- Having `helm` and `tilt` installed


This script is taking care of all of this, and will install the missing elements

## Installation
- Add your integration token into the `snyk-monitor-secret.yaml` file
- Run the `setup.sh` script
- Enjoy


Snyk for K8s is actually installed with the following command
```bash
helm upgrade --install snyk-monitor snyk-charts/snyk-monitor --namespace snyk-monitor --set clusterName="Production cluster"
```

## Checks:
- go to http://localhost:3001/ to check that goof todo is up and running
- Check the tilt console
- Snyk might take a few minutes to load your cluster

## Accessing the dashboard:
```bash
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-sa | awk '{print $1}')
```
for having your token and visit http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/
