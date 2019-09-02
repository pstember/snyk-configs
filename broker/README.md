# Snyk broker docker-compose example

This is an example of how various broker can be configured together for deployment.

## Installation

Clone the repo and create your own environment file. An example is provided for `GitLab`.

Rename `gitlab.env.template` to `gitlab.env` (or whatever name you used in the `docker-compose.yml`

Run the following command

## Usage

```python
docker-compose up --scale broker-gitlab=2
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[WTFPL](https://choosealicense.com/licenses/wtfpl/)
