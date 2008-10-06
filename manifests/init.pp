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
    case $reseolvconf_domain {
        '': { fail("you need to define \$reseolvconf_domain for ${fqdn}") }
    }
    case $resolvconf_search {
        '': { fail("you need to define \$reseolvconf_search for ${fqdn}") }
    }
    case $resolvconf_nameservers {
        '': { fail("you need to define \$reseolvconf_nameservers for ${fqdn}") }
    }

    file { '/etc/resolv.conf':
        path => '/etc/resolv.conf',
        owner => root,
        group => 0,
        mode => 444,
        content => $operatingsystem ? {
            openbsd => template("resolvconf/resolvconf.${operatingsystem}.erb"),
            default => template('resolvconf/resolvconf.erb'),
        }
    }
}
