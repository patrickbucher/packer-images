# Packer

Create a file `ubuntu.pkr.hcl` (check [github.com/hashicorp/virtualbox](https://github.com/hashicorp/virtualbox) for recent version, or use version indication such as `">= 1.0.0"`):

```hcl
packer {
    required_plugins {
        virtualbox = {
            version = "1.0.2"
            source = "github.com/hashicorp/virtualbox"
        }    
    }
}
```

Install the plugin (if not already installed):

```bash
packer init ubuntu.pkr.hcl
```

List installed plugins:

```bash
packer plugins installed
```

Build the image:

```bash
packer build ibuntu.pkr.hcl
```

## Pitfalls

- `http/meta-data` muss vorhanden sein, auch wenn es leer ist
- Escaping bei der `casper`-Kommandozeile muss genau so stimmen

## Links

- [Packer Documentation](https://www.packer.io/docs/)
- [HashiCorp Configuration Language (HCL)](https://www.terraform.io/language/syntax/configuration)
- [VirtualBox Plugin](https://www.packer.io/plugins/builders/virtualbox/iso)
- [Ubuntu Automatic Installation](https://ubuntu.com/server/docs/install/autoinstall)