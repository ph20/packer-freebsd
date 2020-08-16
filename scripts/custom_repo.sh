#!/bin/sh --

echo 'Add mirrors to /usr/local/etc/pkg/repos/'
mkdir -p /usr/local/etc/pkg/repos/
cat <<'EOF' > /usr/local/etc/pkg/repos/mirrorsxtomnl.conf
mirrorsxtomnl: {
    url: https://mirrors.xtom.nl/freebsd-pkg/${ABI}/quarterly
    url: http://flashback.sorbs.net/packages/
}
EOF

echo 'Disable main FreeBsd repo'
cat <<'EOF' > /usr/local/etc/pkg/repos/FreeBSD.conf
FreeBSD: {
        enabled: no
}
EOF


