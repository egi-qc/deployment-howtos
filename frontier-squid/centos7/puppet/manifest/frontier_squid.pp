include umd

class { 'frontier::squid':
    customize_params => {cache_size => 10000},
    cache_dir        => '/var/cache/squid',
    require          => Class["umd"]
}
