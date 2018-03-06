class {"umd": before => Class["fts::install"]}
class {"fts::install": require => Class["umd"]}
class {"fts_mysql": require => Class["fts::install"]}
class {"fts::config": require => Class["fts_mysql"]}
class {"fts::service": require => Class["fts::config"]}


class fts_mysql {
    # TODO(orviz) use mysql module for these execs
    $db_name = hiera("fts3_db_name")
    $db_user = hiera("fts3_db_username")
    $db_pass = hiera("fts3_db_password")

    if $::operatingsystem in ["CentOS", "Scientific"] {
        $schema = "/usr/share/fts-mysql/fts-schema-3.0.0.sql"
        if $::operatingsystem in ["CentOS"] {
            $pkg = ["mariadb-server", "mod_ssl"]
            $srv = "mariadb"
        }
        elsif $::operatingsystem in ["Scientific"] {
            $pkg = ["mysql-server", "mod_ssl"]
            $srv = "mysqld"
        }
    }

    package {
        $pkg:
            ensure => installed,
    }
    
    service {
        $srv:
            enable  => true,
            ensure  => running,
            require => Package[$pkg],
    }

    exec {
        "create-db":
            command => "/usr/bin/mysql -e \"CREATE DATABASE IF NOT EXISTS ${db_name}\"",
            notify  => Exec["import-db"],
            require => Service[$srv]
    }
    exec {
        "import-db":
            command     => "/usr/bin/mysql ftsdb < $schema",
            refreshonly => true,
    }
    exec {
        "grant-perms":
            command => "/usr/bin/mysql -e \"GRANT ALL ON ${db_name}.* TO ${db_user}@'localhost' IDENTIFIED BY '${db_pass}';\"",
            require => Exec["import-db"]
    }
    exec {
        "flush-privileges":
            command => "/usr/bin/mysql -e \"FLUSH PRIVILEGES;\"",
            require => Exec["grant-perms"]
    }
}
