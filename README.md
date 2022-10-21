# docker-puppet

Deploys a full puppet environment with:
* Puppet master
* PuppetDB
* PostgreSQL
* PuppetBoard

Certificate auto-signing is active by default.

It can be deactivated setting the `AUTOSIGN=false` enviroment variable in `docker-compose.yml`,
but you need to remember to sign the certificate for PuppetDB on the first provisioning:

```sh
./puppetserver ca sign --certname puppetdb
```

## Usage

Clone the repository
```sh
git clone git@github.com:miklinux/docker-puppet.git
cd docker-puppet
```

Start the environment
```sh
docker compose up -d
```

Check logs to ensure the environment is up and running
```sh
docker compose logs -f
```

Deploy puppet environment via r10k
```sh
./r10k deploy environment production -v
```

## Other commands

List certificates:
```sh
./puppetserver ca list --all
```

Sign certificate:
```
./puppetserver ca sign --certname foo.example.com
```

Remove a node:
```sh
./puppet node clean foo.example.com
./puppet node deactivate foo.example.com
```
