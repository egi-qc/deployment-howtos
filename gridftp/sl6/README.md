## Directory structure

    |-- Puppetfile
    |-- puppet
        |-- hiera.yaml
        |-- hieradata
            |-- umd.yaml
            |-- extra_vars.yaml
        |-- manifests
            |-- gridftp.pp

## Hiera variables

Do not rely on the values set for the variables in the Hiera YAML files 
within `puppet/hieradata/`; set here the right values that work for your
environment.

## Deployment with Puppet (use `sudo` with non-root accounts)

    $ git clone https://github.com/egi-qc/jenkins-builds && cd jenkins-builds/gridftp/sl6
    
    $ librarian-puppet install --clean --path=/etc/puppet/modules --verbose
    
    $ cp puppet/hiera.yaml /etc/puppet/hiera.yaml
    $ cp -r puppet/hieradata /etc/puppet/hieradata
    
    $ puppet apply --modulepath /etc/puppet/modules manifests/gridftp.pp
