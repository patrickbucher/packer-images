packer {
    required_plugins {
        virtualbox = {
            version = "1.0.2"
            source = "github.com/hashicorp/virtualbox"
        }    
    }
}

source "virtualbox-iso" "ubuntu" {
    boot_wait = "5s"
    boot_command = [
        "c",
        "<wait5s>",
        "linux /casper/vmlinuz \"ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/\" autoinstall ---",
        "<enter>",
        "initrd /casper/initrd",
        "<enter>",
        "boot",
        "<enter>",
    ]
    guest_os_type = "Ubuntu_64"
    iso_url = "https://releases.ubuntu.com/jammy/ubuntu-22.04-live-server-amd64.iso"
    iso_checksum = "sha256:84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
    iso_interface = "sata"
    http_directory = "http"
    disk_size = "25000"
    memory = 4096
    ssh_username = "packer"
    ssh_password = "packer"
    shutdown_command = "sudo poweroff"
    headless = false
    vboxmanage = [
        ["modifyvm", "{{.Name}}", "--firmware", "EFI"]
    ]
    output_directory = "./images"
}

build {
    sources = ["sources.virtualbox-iso.ubuntu"]
}