class {"umd": before => Class["Lcgdm::Dpm::Install",
                              "Gridftp::Install",
                              "Lcgdm::Mkgridmap::Install",
                              "Dmlite::Plugins::Mysql::Install",
                              "Dmlite::Plugins::Memcache::Install",
                              "Dmlite::Srm::Install",
                              "Voms::Install"]}

class{'dpm::head_disknode':
   configure_default_pool       => true,
   configure_default_filesystem => true,
   disk_nodes                   => ['localhost'],
   localdomain                  => 'egi.ifca.es',
   db_pass                      => 'MYSQLPASS',
   mysql_root_pass              => 'PASS',
   token_password               => 'TOKEN_PASSWORD',
   xrootd_sharedkey             => 'A32TO64CHARACTERKEYTESTTESTTESTTEST',
   site_name                    => 'CNR_DPM_TEST',
   volist                       => [dteam],
   xrootd_use_voms              => false,
   require                      => Class["umd"],
}
