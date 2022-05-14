packer {
    required_plugins {
        virtualbox = {
            version = "1.0.2"
            source = "github.com/hashicorp/virtualbox"
        }    
    }
}

variable "iso_url" {
    type = string
    description = "The URL for the Ubuntu ISO image, to be found at https://releases.ubuntu.com/"
}

variable "iso_checksum" {
    type = string
    description = "The checksum of the ISO image (see variable 'isu_url') with a prefix like sha256: or md5:"
}

variable "disk_size" {
    type = number 
    description = "The disk size in megabytes"
}

variable "memory" {
    type = number
    description = "The memory size in megabytes"
}

variable "output" {
    type = string
    description = "A name to be used for the output in the ./images/ folder"
}

source "virtualbox-iso" "ubuntu" {
    boot_wait = "5s"
    boot_command = [
        "c",
        "linux /casper/vmlinuz \"ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/\" autoinstall ---",
        "<enter>",
        "initrd /casper/initrd",
        "<enter>",
        "boot",
        "<enter>",
    ]
    guest_os_type = "Ubuntu_64"
    iso_url = var.iso_url
    iso_checksum = var.iso_checksum
    iso_interface = "sata"
    http_directory = "http-ubuntu-desktop"
    disk_size = "${var.disk_size}"
    memory = var.memory
    ssh_username = "packer"
    ssh_password = "packer"
    ssh_timeout = "15m"
    shutdown_command = "echo -n 'packer' | sudo -S poweroff"
    headless = false
    vboxmanage = [
        ["modifyvm", "{{.Name}}", "--firmware", "EFI"]
    ]
    output_directory = "./images/${var.output}"
}

build {
    sources = ["sources.virtualbox-iso.ubuntu"]
}