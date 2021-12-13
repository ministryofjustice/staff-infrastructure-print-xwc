# Cloud-Agent

This module is designed to to deploy the cloud agent virtual machines and load balancers

In essence, this consists of a two virtual machines load balanced by a Load Balancer, there is no public access.

The vm_details variable, see below contains the vm and load balancer definitions, there is a bit of repetition that could potentially be improved, e.g. load balancer ip address, but the intention is to capture the information in a single object which allows usage of for each loops

```hcl
variable "vm_details" {
  type = map(object({
    availability_zone = list(string),
    nic = object({
      subnet     = string
      ip_address = string
    }),
    load_balancer=object({
      name = string
      ip_address= string
    }),
    storage_data_disk = object({
      type = string
      size = string
    })
    tag_update_class = string,
    os_disk_type     = string,
    vm_size          = string
  }))
}
```

