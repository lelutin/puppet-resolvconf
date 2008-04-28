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
    notice("real_resolvconf_nameservers: $real_resolvconf_nameservers")
    $real_resolvconf_nameservers = $resolvconf_nameservers ? {
        ''  => '212.103.67.60:212.103.67.61',
        default => $resolvconf_nameservers,
    }

    file { '/etc/resolv.conf':
        path => '/etc/resolv.conf',
        owner => root,
        group => 0,
        mode => 444,
        content => template("resolvconf/resolvconf.erb")
    }


}



