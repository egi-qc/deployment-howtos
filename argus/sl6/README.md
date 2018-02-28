## Directory structure

    |-- vars
        |-- umd.yaml
        |-- extra_vars.yaml

## Variables

Do not rely on the values set for the variables in the YAML files; set here 
the right values that work for your environment.

## Deployment with Usage: ansible-pull -U <repository> [options]

Options:
  --accept-host-key     adds the hostkey for the repo url if not already added
  --ask-vault-pass      ask for vault password
  -C CHECKOUT, --checkout=CHECKOUT
                        branch/tag/commit to checkout.  Defaults to behavior
                        of repository module.
  --clean               modified files in the working repository will be
                        discarded
  -d DEST, --directory=DEST
                        directory to checkout repository to
  -e EXTRA_VARS, --extra-vars=EXTRA_VARS
                        set additional variables as key=value or YAML/JSON
  -f, --force           run the playbook even if the repository could not be
                        updated
  --full                Do a full clone, instead of a shallow one.
  -h, --help            show this help message and exit
  -i INVENTORY, --inventory-file=INVENTORY
                        specify inventory host path
                        (default=/etc/ansible/hosts) or comma separated host
                        list.
  -l SUBSET, --limit=SUBSET
                        further limit selected hosts to an additional pattern
  --list-hosts          outputs a list of matching hosts; does not execute
                        anything else
  -m MODULE_NAME, --module-name=MODULE_NAME
                        Repository module name, which ansible will use to
                        check out the repo. Default is git.
  -M MODULE_PATH, --module-path=MODULE_PATH
                        specify path(s) to module library (default=None)
  --new-vault-password-file=NEW_VAULT_PASSWORD_FILE
                        new vault password file for rekey
  -o, --only-if-changed
                        only run the playbook if the repository has been
                        updated
  --output=OUTPUT_FILE  output file name for encrypt or decrypt; use - for
                        stdout
  --purge               purge checkout after playbook run
  --skip-tags=SKIP_TAGS
                        only run plays and tasks whose tags do not match these
                        values
  -s SLEEP, --sleep=SLEEP
                        sleep for random interval (between 0 and n number of
                        seconds) before starting. This is a useful way to
                        disperse git requests
  -t TAGS, --tags=TAGS  only run plays and tasks tagged with these values
  --track-subs          submodules will track the latest changes This is
                        equivalent to specifying the --remote flag to git
                        submodule update
  -U URL, --url=URL     URL of the playbook repository
  --vault-password-file=VAULT_PASSWORD_FILE
                        vault password file
  -v, --verbose         verbose mode (-vvv for more, -vvvv to enable
                        connection debugging)
  --verify-commit       verify GPG signature of checked out commit, if it
                        fails abort running the playbook. This needs the
                        corresponding VCS module to support such an operation
  --version             show program's version number and exit

  Connection Options:
    control as whom and how to connect to hosts

    -k, --ask-pass      ask for connection password
    --private-key=PRIVATE_KEY_FILE, --key-file=PRIVATE_KEY_FILE
                        use this file to authenticate the connection
    -u REMOTE_USER, --user=REMOTE_USER
                        connect as this user (default=None)
    -c CONNECTION, --connection=CONNECTION
                        connection type to use (default=smart)
    -T TIMEOUT, --timeout=TIMEOUT
                        override the connection timeout in seconds
                        (default=10)
    --ssh-common-args=SSH_COMMON_ARGS
                        specify common arguments to pass to sftp/scp/ssh (e.g.
                        ProxyCommand)
    --sftp-extra-args=SFTP_EXTRA_ARGS
                        specify extra arguments to pass to sftp only (e.g. -f,
                        -l)
    --scp-extra-args=SCP_EXTRA_ARGS
                        specify extra arguments to pass to scp only (e.g. -l)
    --ssh-extra-args=SSH_EXTRA_ARGS
                        specify extra arguments to pass to ssh only (e.g. -R)

  Privilege Escalation Options:
    control how and which user you become as on target hosts

    --ask-sudo-pass     ask for sudo password (deprecated, use become)
    --ask-su-pass       ask for su password (deprecated, use become)
    -K, --ask-become-pass
                        ask for privilege escalation password

    $ git clone https://github.com/egi-qc/ansible-argus /tmp/ansible-argus

    $ ansible-galaxy install -r /tmp/ansible-argus/requirements.yml

    $ ansible-pull -vvv -C master -d /etc/ansible/roles/ansible-argus -i /etc/ansible/roles/ansible-argus/hosts -U https://github.com/egi-qc/ansible-argus --extra-vars '@vars/umd.yaml' --extra-vars '@vars/extra_vars.yaml' --tags 'all'

Please note:
  - _Use `sudo` with non-root accounts_

Jenkins build URL: 
