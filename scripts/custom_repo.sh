#!/bin/sh --

echo 'Add mirrors to /usr/local/etc/pkg/repos/'
mkdir -p /usr/local/etc/pkg/repos/
cat <<'EOF' > /usr/local/etc/pkg/repos/mirrorsxtomnl.conf
mirrorsxtomnl: {
    url: https://mirrors.xtom.nl/freebsd-pkg/${ABI}/quarterly
}
EOF
#cat <<'EOF' > /usr/local/etc/pkg/repos/flashbacksorbsnet.conf
#flashbacksorbsnet: {
#    url: http://flashback.sorbs.net/packages/${ABI}
#}
#EOF

echo 'Disable main FreeBsd repo'
cat <<'EOF' > /usr/local/etc/pkg/repos/FreeBSD.conf
FreeBSD: {
        enabled: no
}
EOF


