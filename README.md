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
bin/puppetserver ca sign --certname puppetdb
```

## Usage

Start the enviornment
```sh
docker compose up
```

List certificates:
```sh
bin/puppetserver ca list --all
```

Sign certificate:
```
bin/puppetserver ca sign --certname foo.example.com
```

Delete node:
```sh
bin/puppet node clean foo.example.com
bin/pupept node deactivate foo.example.com
```
