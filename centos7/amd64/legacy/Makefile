build:
	PACKER_LOG=1  /usr/bin/packer build -force centos.json
install:
	virt-install --virt-type kvm --arch=x86_64 --name centos7 --accelerate  --ram 16284 --vcpus=8 --cpu host --disk path=_output/centos_amd64,device=disk,bus=virtio,format=qcow2 --os-variant centos7   --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > libvirt.centos7.xml
	virsh define  libvirt.centos7.xml
	virsh start centos7
