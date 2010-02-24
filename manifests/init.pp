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

class resolvconf {
    case $operatingsystem {
        openbsd: {
            info('$resolvconf_domain and $resolvconf_search not needed on openbsd')
        }
        default: {
            if ! $resolvconf_domain {
                fail("you need to define \$resolvconf_domain for ${fqdn}")
            }
            if ! $resolvconf_search {
                fail("you need to define \$resolvconf_search for $fqdn")
            }
        }
    }
    if ! $resolvconf_nameservers {
        fail("you need to define \$resolvconf_nameservers for $fqdn")
    }
    file{'/etc/resolv.conf':
        path => '/etc/resolv.conf',
        owner => root, group => 0, mode => 0444,
        content => $operatingsystem ? {
            openbsd => template("resolvconf/resolvconf.$operatingsystem.erb"),
            default => template('resolvconf/resolvconf.erb'),
        }
    }
}
