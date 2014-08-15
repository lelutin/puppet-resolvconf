#
# resolvconf module
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Haerry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License version 3 as published by
# the Free Software Foundation.
#

class resolvconf(
  $domain = $::domain,
  $search = $::domain,
  $nameservers = [
    '77.109.138.45',
    '77.109.139.29',
  ]
) {
  $content = $::operatingsystem ? {
    openbsd => template("resolvconf/resolvconf.${::operatingsystem}.erb"),
    default => template('resolvconf/resolvconf.erb'),
  }
  file{'/etc/resolv.conf':
    content => $content,
    owner   => root,
    group   => 0,
    mode    => '0444';
  }
}
