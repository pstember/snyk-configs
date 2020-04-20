#!/bin/bash

shopt -s expand_aliases
alias ktilt='/usr/local/bin/tilt'

exists()
{
  type "$1" >/dev/null 2>&1
}

if exists ktilt ; then
	echo Tilt is already installed
else
	# To install tilt
    curl -fsSL https://raw.githubusercontent.com/windmilleng/tilt/master/scripts/install.sh | bash
    alias ktilt='/usr/local/bin/tilt'
fi

if exists helm ; then
	echo Helm is already installed
else
	# To install helm
	brew install kubernetes-helm
	helm init -wait
fi

helm repo add snyk-charts https://snyk.github.io/kubernetes-monitor/
helm repo update



# Print your token with the following command (for the dashboard)
echo kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-sa | awk '{print $1}')
echo Your token is
echo ====
echo $(kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-sa | awk '{print $1}') | sed -n "/token:/s/token:      //p")
echo ====

# To access the dashboard run the following command then go to http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/
echo kubectl proxy
echo http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/

# To get snyk up and running
# I couldn't get this to work in Tile because I need a different namespace and couldn't work out how to get it to switch context
# echo helm upgrade --install snyk-monitor snyk-charts/snyk-monitor --namespace snyk-monitor --set clusterName="Production cluster"

ktilt up