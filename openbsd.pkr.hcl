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
    description = "The URL for the ISO image, to be found at https://www.openbsd.org/faq/faq4.html#Download"
}

variable "iso_checksum" {
    type = string
    description = "The checksum of the ISO image (see variable 'isu_url') with a prefix like sha256: or md5:"
}

variable "cpus" {
    type = number
    description = "The number of CPU cores"
}

variable "disk_size" {
    type = number 
    description = "The disk size in megabytes"
}

variable "memory" {
    type = number
    description = "The memory size in megabytes"
}

variable "codename" {
    type = string
    description = "A name suffix to be used for the output in the ./images/ folder"
}

source "virtualbox-iso" "openbsd" {
    boot_wait = "45s"
    boot_command = [
        "A",
        "<enter>",
        "<wait5s>",
        "http://{{.HTTPIP}}:{{.HTTPPort}}/install.conf",
        "<wait5s>",
        "<enter>"
    ]
    guest_os_type = "OpenBSD_64"
    iso_url = var.iso_url
    iso_checksum = var.iso_checksum
    iso_interface = "sata"
    http_directory = "http-openbsd"
    cpus = var.cpus
    disk_size = "${var.disk_size}"
    memory = var.memory
    ssh_username = "root"
    ssh_password = "packer"
    ssh_timeout = "10m"
    shutdown_command = "shutdown -p now"
    headless = false
    output_directory = "./images/openbsd${var.codename}"
    keep_registered = true
}

build {
    sources = ["sources.virtualbox-iso.openbsd"]
    provisioner "shell" {
        scripts = [
            "./scripts/openbsd-setup-doas.sh",
            "./scripts/openbsd-disable-root-ssh.sh"
        ]
    }
}