build:
	PACKER_LOG=1  /usr/local/bin/packer build -force ubuntu-jammy.pkr.hcl
sysprep:
	virt-sysprep --operations abrt-data,backup-files,bash-history,blkid-tab,crash-data,cron-spool,dhcp-client-state,dhcp-server-state,dovecot-data,logfiles,machine-id,mail-spool,net-hostname,net-hwaddr,pacct-log,package-manager-cache,pam-data,passwd-backups,puppet-data-log,rh-subscription-manager,rhn-systemid,rpm-db,samba-db-log,script,smolt-uuid,ssh-userdir,sssd-db-log,tmp-files,udev-persistent-net,utmp,yum-uuid,customize -a _output/ubuntu
install:
	virt-install --virt-type kvm --arch=x86_64 --name ubuntu --accelerate  --ram 16284 --vcpus=8 --cpu host --disk path=_output/ubuntu,device=disk,bus=virtio,format=qcow2 --os-variant ubuntu22.04 --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > /tmp/libvirt.ubuntu.xml
	virsh define  /tmp/libvirt.ubuntu.xml
	virsh start ubuntu
clean:
	virsh destroy ubuntu
	virsh undefine ubuntu
	rm -rf _output/
