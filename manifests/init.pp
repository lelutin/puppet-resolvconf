# modules/resolvconf/manifests/init.pp - manage resolvconf stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# adapted by Puzzle ITC - haerry+puppet(at)puzzle.ch

# modules_dir { "resolvconf": }

class resolvconf {
    $real_resolvconf_domain = $resolvconf_domain ? {
        ''  => 'rz.puzzle.ch',
        default => $resolvconf_domain,
    }
    $real_resolvconf_search = $resolvconf_search ? {
        ''  => 'rz.puzzle.ch',
        default => $resolvconf_search,
    }
    $real_resolvconf_nameservers = $resolvconf_nameservers ? {
        ''  => '195.141.101.81:195.141.101.82',
        default => $resolvconf_nameservers,
    }

    file { '/etc/resolv.conf':
        path => '/etc/resolv.conf',
        owner => root,
        group => 0,
        mode => 444,
        content => template("resolvconf/resolvconf.erb")
    }

    if $use_shorewall {
        include resolvconf::shorewall
    }
}
