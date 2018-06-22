## Directory structure

    |-- vars
        |-- umd.yaml
        |-- extra_vars.yaml

## Variables

Do not rely on the values set for the variables in the YAML files; set here 
the right values that work for your environment.

## Deployment with `ansible-pull`

    $ git clone https://github.com/egi-qc/ansible-grid-clients /tmp/ansible-grid-clients

    $ ansible-galaxy install -p /etc/ansible/roles -r /tmp/ansible-grid-clients/requirements.yml

    $ ansible-pull -vvv -C master -d /etc/ansible/roles/ansible-grid-clients -i /etc/ansible/roles/ansible-grid-clients/hosts -U https://github.com/egi-qc/ansible-grid-clients --extra-vars '@vars/umd.yaml' --extra-vars '@vars/extra_vars.yaml' --tags 'all'

Please note:
  - _Use `sudo` with non-root accounts_

Jenkins build URL: https://jenkins.egi.ifca.es/job/grid-clients/48
