# manifests/shorewall.pp

class resolvconf::shorewall {
    include shorewall

    shorewall::rule {
        'me-net-tcp_dns':
                        source          =>      '$FW',
                        destination     =>      'net',
                        proto           =>      'tcp',
                        destinationport =>      '53',
                        order           =>      250,
                        action          =>      'ACCEPT';
        'me-net-udp_dns':
                        source          =>      '$FW',
                        destination     =>      'net',
                        proto           =>      'udp',
                        destinationport =>      '53',
                        order           =>      251,
                        action          =>      'ACCEPT'; 
    }
}
