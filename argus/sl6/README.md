    $ git clone https://github.com/egi-qc/ansible-argus /tmp/ansible-argus

    $ ansible-galaxy install -r /tmp/ansible-argus/requirements.yml

    $ ansible-pull -vvv -C master -d /etc/ansible/roles/ansible-argus -i /etc/ansible/roles/ansible-argus/hosts -U https://github.com/egi-qc/ansible-argus --extra-vars '@vars/umd.yaml' --extra-vars '@vars/extra_vars.yaml' --tags 'all'
