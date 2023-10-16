build:
	PACKER_LOG=1  /usr/local/bin/packer  build -force almalinux.json
install:
	virt-install --virt-type kvm --arch=x86_64 --name almalinux8 --accelerate  --ram 16284 --vcpus=8 --cpu host --disk path=_output/almalinux_amd64,device=disk,bus=virtio,format=qcow2 --os-variant almalinux8 --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > libvirt.almalinux8.xml
	virsh define  libvirt.almalinux8.xml
	virt-sysprep -d almalinux8
	virsh undefine  almalinux8
	# virsh start almalinux8
