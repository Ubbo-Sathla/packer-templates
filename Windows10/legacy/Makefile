build:
	PACKER_LOG=1 packer build windows10.json

clean:
	virsh  destroy windows10
	virsh  undefine windows10
	
install:
	virt-install  --virt-type kvm --arch=x86_64 --name windows10 --accelerate  --ram 16284 --vcpus=8 --cpu host --disk path=_out/windows-10,device=disk,bus=virtio,format=qcow2 --os-variant win10   --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > libvirt.windows10.xml
	virsh define libvirt.windows10.xml
	virsh start windows10

