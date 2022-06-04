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
`vars/ubuntu-server-20.04.pkrvars.hcl` or
`vars/ubuntu-server-22.04.pkrvars.hcl`, respectively, and build it:

```bash
packer build -var-file vars/ubuntu-server-20.04.pkrvars.hcl ubuntu-server.pkr.hcl
packer build -var-file vars/ubuntu-server-22.04.pkrvars.hcl ubuntu-server.pkr.hcl
```

Same for the desktop:

```bash
packer build -var-file vars/ubuntu-desktop-20.04.pkrvars.hcl ubuntu-desktop.pkr.hcl
packer build -var-file vars/ubuntu-desktop-22.04.pkrvars.hcl ubuntu-desktop.pkr.hcl
```

Or for OpenBSD (7.0 or 7.1):

```bash
packer build -var-file vars/openbsd70.pkrvars.hcl openbsd.pkr.hcl
packer build -var-file vars/openbsd71.pkrvars.hcl openbsd.pkr.hcl
```

## Pitfalls

### Ubuntu

- `http/meta-data` must be available, even though it is just an empty file
- Make sure that the escaping of the `casper` command is accurate.
- Use the server images for the desktop installation, too; the desktop image
  only provides a graphical installer from a live GUI environment, which is bad
  for automation.

### OpenBSD

- The line endings in `http-openbsd/install.conf` must be CR, not CRLF!

## Links

- [Packer Documentation](https://www.packer.io/docs/)
- [HashiCorp Configuration Language (HCL)](https://www.terraform.io/language/syntax/configuration)
- [VirtualBox Plugin](https://www.packer.io/plugins/builders/virtualbox/iso)
- [Ubuntu Automatic Installation](https://ubuntu.com/server/docs/install/autoinstall)

## TODO

- provide variable `additional_packages` that is used in a `apt install -y ${var.additional_packages}` build step
- get rid of floppy

# Why Packer?

Packer allows you to define your base images as code, which is a part of the
greater _Infrastructure as Code_ idea. But why building infrastructure as code?

- _Reusability_: Code allows you to build many instances of the same thing --
  identical or with parametrized variations of it.
- _Consistency_: Code allows you to build everything the same way every time.
  The outcome becomes predictable.
- _Transparency_: Code allows you to understand how something is built; it can
  be reviewed, commented, audited, and improved.
- _Reproducibility_: Code allows you to build things at a whim; the only
  decision is whether or not you want to build the thing; not how to do so.
- _Disposability_: Code allows you to discard of broken things, because it is
  easy and safe to replace everything by re-building it.

