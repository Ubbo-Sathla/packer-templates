build:
	rm -rf ./_out
	PACKER_LOG=1 packer build win2k16.json

clean:
	rm -rf ./_out
	rm -rf libvirt.win2k16.xml
	virsh undefine --nvram --domain win2k16
	virsh  destroy win2k16 
	
install:
	virt-install --boot loader=/usr/share/OVMF/OVMF_CODE.fd,loader_ro=yes --machine q35  --virt-type kvm  --arch=x86_64 --name win2k16 --cpu host-passthrough --vcpus=8  --memory 16284 --disk path=_out/win2k16,bus=virtio --os-variant win2k16 --network network=default,model=virtio --graphics vnc,password="111111",port=5910,listen=0.0.0.0  --noautoconsole --autostart   --print-xml > libvirt.win2k16.xml
	virsh define libvirt.win2k16.xml
	virsh start win2k16
	# /usr/bin/qemu-system-x86_64  -bios /usr/share/OVMF/OVMF_CODE.fd  -device ide-hd,drive=drive0,bootindex=0 -drive if=none,file=./_out/win2k16,id=drive0,cache=writeback,discard=ignore   -machine type=q35,accel=kvm -device e1000,netdev=user.0   -netdev user,id=user.0,hostfwd=tcp::4388-:5985  -name win2k16 -vnc 0.0.0.0:10 -smp 8 -m 16g

