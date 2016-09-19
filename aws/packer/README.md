## Packer usage

```bash
AWS_PROFILE=continuousphp-ami packer build php7.0-apache2-fpm-ubuntu-xenial-us-east-1.json
```

### Debuging mode

```bash
AWS_PROFILE=continuousphp-ami packer build -debug php7.0-apache2-fpm-ubuntu-xenial-us-east-1.json
```

## Getting cookbook dependencies

```bash
cd ../../cookbooks/php7.0-apache2-fpm/
berks vendor ../vendor
```
