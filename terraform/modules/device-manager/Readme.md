# Device-Manager

This module is designed to to deploy the device manager virtual machines, sql server (PaaS) and a DB per VM.

In essence, this consists of a virtual machine, a sql server with a elastic pool and a database, configured to be only accessible via private link.

The vm_details variable, see below, tries to capture the most important parts of the deployment thus it eliminates things like the image details as it will be the same, at least that's the theory.

```hcl
    availability_zone = list(string),
    nic = object({
      subnet     = string
      ip_address = string
    }),
    storage_data_disk = object({
      type = string
      size = string
    })
    tag_update_class = string,
    os_disk_type     = string,
    vm_size          = string
  }))
```

