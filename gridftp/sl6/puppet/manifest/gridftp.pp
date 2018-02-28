class {"umd": before => Class["gridftp::install"]}

include gridftp::params
file { $gridftp::params::certificate: }
file { $gridftp::params::key: }

class { "gridftp": require => Class["umd"] }
