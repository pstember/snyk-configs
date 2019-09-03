# Snyk broker examples

This is an example of how various broker can be configured together for deployment.

## Docker-compose

### Installation

Clone the repo and create your own environment file. An example is provided for `GitLab`.

Rename `gitlab.env.template` to `gitlab.env` (or whatever name you used in the `docker-compose.yml`

Run the following command

### Usage

```bash
docker-compose pull && docker-compose up --scale broker-gitlab=2 --scale broker-github-com=2
```

You can check that the set-up was sucessful by visiting `http://localhost:4000/healthcheck`

## Kubernetes

### Installation

Clone the repo and create your own environment file. An example is provided for `GitLab`.

Rename `broker-gitlab-gitlab-env-configmap.yaml.template` to `broker-gitlab-gitlab-env-configmap.yaml`

Run the following command

### Usage

```bash
kubectl apply -f broker-github-com-deployment.yaml,broker-github-com-github-com-env-configmap.yaml
kubectl expose deployment broker-gitlab --type=LoadBalancer
```

You can check that the set-up was sucessful by visiting `http://localhost:7000/healthcheck`

Then it should work in theory. If it doesn't try doing the following

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml
```

and re-run the above

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[WTFPL](https://choosealicense.com/licenses/wtfpl/)
