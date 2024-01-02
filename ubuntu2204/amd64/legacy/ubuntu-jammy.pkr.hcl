# This file was autogenerated by the 'packer hcl2_upgrade' command. We
# recommend double checking that everything is correct before going forward. We
# also recommend treating this file as disposable. The HCL2 blocks in this
# file can be moved to other files. For example, the variable blocks could be
# moved to their own 'variables.pkr.hcl' file, etc. Those files need to be
# suffixed with '.pkr.hcl' to be visible to Packer. To use multiple files at
# once they also need to be in the same folder. 'packer inspect folder/'
# will describe to you what is in that folder.

# Avoid mixing go templating calls ( for example ```{{ upper(`string`) }}``` )
# and HCL2 calls (for example '${ var.string_value_example }' ). They won't be
# executed together and the outcome will be unknown.

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
source "qemu" "ubuntu" {
  accelerator      = "kvm"
  boot_command     = ["e<down><down><down><end>", " autoinstall ip=dhcp ds=\"nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\"", "<F10>"]
  boot_wait        = "5s"
  disk_compression = false
  disk_interface   = "virtio-scsi"
  disk_size        = "40G"
  format           = "qcow2"
  headless         = true
  http_directory   = "./http"
  iso_checksum     = "none"
  iso_url          = "/opt/iso/ubuntu-22.04.3-live-server-amd64.iso"
  machine_type     = "q35"
  net_device       = "virtio-net"
  output_directory = "./_output"
  qemu_binary      = "/usr/local/qemu-7.2.1/bin/qemu-system-x86_64"
  # qemuargs         = [["-m", "8192M"], ["-cpu", "host"], ["-smp", "cpus=1,maxcpus=16,cores=4"],["-device", "vfio-pci,host=af:00.0,multifunction=on"],[ "-device", "vfio-pci,host=af:00.1"]]
  qemuargs         = [["-m", "8192M"], ["-cpu", "host"], ["-smp", "cpus=1,maxcpus=16,cores=4"]]
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  ssh_password     = "Ubuntu"
  ssh_timeout      = "40m"
  ssh_username     = "ubuntu"
  vm_name          = "ubuntu"
  vnc_bind_address = "10.119.1.20"
  vnc_use_password = true
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.qemu.ubuntu"]

  provisioner "shell" {
    scripts = [
      "scripts/nvidia/install.sh",
      "scripts/cloud-init.sh"
    ]
  }

}