## Directory structure

    |-- Puppetfile
    |-- puppet
        |-- hiera.yaml
        |-- hieradata
            |-- umd.yaml
            |-- extra_vars.yaml
        |-- manifests
            |-- dpm.pp

## Hiera variables

Do not rely on the values set for the variables in the Hiera YAML files 
within `puppet/hieradata/`; set here the right values that work for your
environment.

## Deployment with `puppet apply`

    $ git clone https://github.com/egi-qc/deployment-howtos && cd deployment-howtos/dpm/centos7
    
    $ librarian-puppet install --clean --path=/etc/puppet/modules --verbose
    
    $ cp puppet/hiera.yaml /etc/puppet/hiera.yaml
    $ cp -r puppet/hieradata /etc/puppet/hieradata
    
    $ puppet apply --modulepath /etc/puppet/modules manifests/dpm.pp

Please note:
  - _Use `sudo` with non-root accounts_
  - `librarian-puppet` is only needed for deploying the module dependencies. If you
    have installed them manually, ignore this step.

Product version:
Jenkins build URL: https://jenkins.egi.ifca.es/job/QualityCriteriaValidation/dpm/38
