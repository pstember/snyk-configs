#alias ktilt='tilt'

# To install tilt
curl -fsSL https://raw.githubusercontent.com/windmilleng/tilt/master/scripts/install.sh | bash

# To install helm
brew install kubernetes-helm
helm init

mkdir snyk-monitor
cd snyk-monitor

git clone git@github.com:pstember/snyk-configs.git
cd snyk-configs/kubernetes

helm repo add snyk-charts https://snyk.github.io/kubernetes-monitor/
helm repo update

# wget -O kubernetes-dashboard.yaml https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
tilt up

# Print your token with the following command (for the dashboard)
# kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-sa | awk '{print $1}')

# To access the dashboard run the following command then go to http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/
# kubectl proxy

# To get snyk up and running
# I couldn't get this to work in Tile because I need a different namespace and couldn't work out how to get it to switch context
# helm upgrade --install snyk-monitor snyk-charts/snyk-monitor --namespace snyk-monitor --set clusterName="Production cluster"