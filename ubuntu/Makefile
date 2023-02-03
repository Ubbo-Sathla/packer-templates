build:
	PACKER_LOG=1  /usr/local/bin/packer build -force ubuntu.json
sysprep: install
	virt-sysprep -d ubuntu
install:
	virt-install --virt-type kvm --arch=x86_64 --name ubuntu --accelerate  --ram 16284 --vcpus=8 --cpu host --disk path=_output/ubuntu,device=disk,bus=virtio,format=qcow2 --os-variant ubuntu22.04 --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > /tmp/libvirt.ubuntu.xml
	virsh define  /tmp/libvirt.ubuntu.xml
start:
	virsh start ubuntu
clean:
	virsh destroy ubuntu
	virsh undefine ubuntu
	rm -rf _output/
