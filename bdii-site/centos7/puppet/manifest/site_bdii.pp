class { "umd": before => Class["bdii::install"] }
class { "bdii::install": require => Class["umd"] }
class { "bdii::config": }
class { "bdii::service": }
class { "bdii::sitebdii": }
