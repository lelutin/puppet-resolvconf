# modules/resolvconf/manifests/init.pp - manage resolvconf stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "resolvconf": }

define resolveconf (
    $domain='glei.ch', 
    $search='glei.ch',
    $nameserver1='212.103.67.60',  
    $nameserver2='212.103.72.231', 
    $nameserver3='192.168.1.104'
) {
    $str = "search $search
domain $domain
nameserver $nameserver1
nameserver $nameserver2
nameserver $nameserver3
"

    file { "/etc/resolv.conf":
        content => $str
    }
}



