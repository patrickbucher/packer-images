packer {
    required_plugins {
        virtualbox = {
            version = "1.0.2"
            source = "github.com/hashicorp/virtualbox"
        }    
    }
}

source "virtualbox-iso" "ubuntu" {
    
    guest_os_type = "Ubuntu_64"
    iso_url = "https://releases.ubuntu.com/jammy/ubuntu-22.04-live-server-amd64.iso"
    iso_checksum = "sha256:84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
    ssh_username = "packer"
    ssh_password = "packer"
    shutdown_command = "sudo shutdown -P now"
}

build {
    sources = ["sources.virtualbox-iso.ubuntu"]
}