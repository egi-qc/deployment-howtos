class {"umd": before => Class["xrootd::install"]}

file {"/etc/grid-security/hostcert.pem": }
file {"/etc/grid-security/hostkey.pem": }

class {"xrootd": require => Class["umd"] }
