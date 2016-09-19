Description
===========

Installs php-7.0 apache2-fpm

Requirements
============

## Platform:

* Ubuntu/Debian

Attributes
==========

## Apache 2

```bash
default['apache2']['hostname'] = 'your-domain-name.com'
default['apache2']['htpasswd'] = false
```

## Unattended-upgrade

```bash
default['unattended-upgrades']['apticron_email'] = 'devops@your-domain-name.com'
```

Usage
=====

Put `recipe[php7.0-apache2-fpm]` in a run list, or `include_recipe 'php7.0-apache2-fpm'` to ensure that sandbox is installed on your systems.

Testing
-------
Default .kitchen.yml test the cookbook in docker containers.

To test locally:

```bash
kitchen list
kitchen converge php70-apache2-fpm-ubuntu-xenial
kitchen verify php70-apache2-fpm-ubuntu-xenial
```

To test the cookbook on AWS instances use:

Configure the access to your AWS account using the AWS CLI:
```bash
aws configure --profile=AWS_CLI_PROFILE
```

copy the .kitchen-aws.yml to .kitchen-aws.local.yml and configure to suite your AWS account.

```bash
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen list

AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify php70-apache2-fpm-ubuntu-xenial-aws
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify php70-apache2-fpm-ubuntu-trusty-aws
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify php70-apache2-fpm-ubuntu-precise-aws
```

To test all at once:

```bash
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify -c 5
```

Refer to the [kitchen-ec2](https://github.com/test-kitchen/kitchen-ec2) documentation

Changes
=======

* v1.0.0: Initial commit

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Increase the version number of the cookbook in the metadata.rb and update this README.md with the version change.
7. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 

* Oswald De Riemaecker (oswald@continuousphp.com)

```text
Copyright 2015, Continuous S.A.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
