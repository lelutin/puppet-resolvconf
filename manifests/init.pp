# modules/resolvconf/manifests/init.pp - manage resolvconf stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "resolvconf": }

class resolvconf {
    $real_resolvconf_domain = $resolvconf_domain ? {
        ''  => 'glei.ch',
        default => $resolvconf_domain,
    }
    $real_resolvconf_search = $resolvconf_search ? {
        ''  => 'glei.ch',
        default => $resolvconf_search,
    }
    $real_resolvconf_nameservers ? $resolvconf_nameservers ? {
        ''  => '212.103.67.60:212.103.67.61:212.103.72.231:192.168.1.104',
        default => $resolvconf_nameserver1,
    }

#    $real_resolvconf_nameserver1 = $resolvconf_nameserver1 ? {
#        ''  => '212.103.67.60',
#        default => $resolvconf_nameserver1,
#    }
#    $real_resolvconf_nameserver2 = $resolvconf_nameserver2 ? {
#        ''  => '212.103.72.231',
#        default => $resolvconf_nameserver2,
#    }
#    $real_resolvconf_nameserver3 = $resolvconf_nameserver3 ? {
#        ''  => '192.168.1.104',
#        default => $resolvconf_nameserver3,
#    }

    file { '/etc/resolv.conf':
        path => '/etc/resolv.conf',
        owner => root,
        group => 0,
        mode => 444,
        content => template("resolvconf/resolvconf.erb")
    }


}



