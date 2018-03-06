include umd

class { 'frontier::squid':
    #customize_file => 'puppet:///modules/mymodule/customize.sh',
    cache_dir      => '/var/cache/squid',
    require        => Class["umd"]
}
