build:
	PACKER_LOG=1 packer build windows2016.json

clean:
	rm -rf libvirt.win2k16.xml
	rm -rf _out/
	virsh  destroy win2k16 
	virsh  undefine win2k16
	
install:
	virt-install  --virt-type kvm --arch=x86_64 --name win2k16 --accelerate  --ram 16284 --vcpus=8 --cpu host --disk path=_out/windows-2016,device=disk,bus=virtio,format=qcow2 --os-variant win2k16 --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > libvirt.win2k16.xml
	virsh define libvirt.win2k16.xml
	virsh start win2k16

