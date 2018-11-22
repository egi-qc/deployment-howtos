class { "umd": before => Class["bdii::install"] }
class { "bdii": require => Class["umd"] }
