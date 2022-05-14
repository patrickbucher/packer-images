# Packer

Create a file `ubuntu-server.pkr.hcl` (check [github.com/hashicorp/virtualbox](https://github.com/hashicorp/virtualbox) for recent version, or use version indication such as `">= 1.0.0"`):

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

## Building the Image

Define your image as in `ubuntu-server.pkr.hcl`, the variables in
`ubuntu-server-20.04.pkrvars.hcl` or `ubuntu-server-22.04.pkrvars.hcl`,
respectively, and build it:

```bash
packer build -var-file ubuntu-server-20.04.pkrvars.hcl ubuntu-server.pkr.hcl
packer build -var-file ubuntu-server-22.04.pkrvars.hcl ubuntu-server.pkr.hcl
```

## Pitfalls

### Ubuntu

- `http/meta-data` must be available, even though it is just an empty file
- Make sure that the escaping of the `casper` command is accurate.

## Links

- [Packer Documentation](https://www.packer.io/docs/)
- [HashiCorp Configuration Language (HCL)](https://www.terraform.io/language/syntax/configuration)
- [VirtualBox Plugin](https://www.packer.io/plugins/builders/virtualbox/iso)
- [Ubuntu Automatic Installation](https://ubuntu.com/server/docs/install/autoinstall)