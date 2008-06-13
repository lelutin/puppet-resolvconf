#
# resolvconf module
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

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
