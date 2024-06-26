# Xerox-Print

This is the Xerox Print repository also known as Xerox Workplace Cloud repository.

## HLD

The HLD is hosted in [confluence](https://dsdmoj.atlassian.net/wiki/spaces/PTTPWIK/pages/3754918031/Xerox+Workplace+Cloud+-+DOM1+Print+Re-compete).

## Environments

Only Development and Production will be stood up.

## Code Structure

In order to minimize code duplication and ensure that code changes are replicated across all environments the code is structured as follows:

```
└── terraform
    ├── environments
    │   ├── dev
    │   │   ├── main.tf -> ../../main.tf
    │   │   ├── plan.plan
    │   │   ├── terraform.tfvars
    │   │   ├── terraform_config.tf
    │   │   ├── update_schedule_template.json -> ../../update_schedule_template.json
    │   │   └── variables.tf -> ../../variables.tf
    │   └── prod
    │       ├── main.tf -> ../../main.tf
    │       ├── terraform.tfvars
    │       ├── terraform_config.tf
    │       ├── update_schedule_template.json -> ../../update_schedule_template.json
    │       └── variables.tf -> ../../variables.tf
    ├── modules
    │   ├── cloud-agent
    │   │   ├── Readme.md
    │   │   ├── data.tf
    │   │   ├── load_balancer.tf
    │   │   ├── variables.tf
    │   │   └── virtual_machine.tf
    │   └── device-manager
    │       ├── Readme.md
    │       ├── data.tf
    │       ├── database.tf
    │       ├── variables.tf
    │       └── virtual_machine.tf
    ├── main.tf
    ├── update_schedule_template.json
    └── variables.tf
```

This ensures that making changes in main will make the changes in both environments

## Code Philosophy

I have tried, wherever possible, to address the problem we have now rather than trying to second guess the future, which is why there is, for instance, a single load balancer rule with a default port. This might, no doubt, seem arbitrary and it largely is as it's a question of judgement.

I think I have erred on the side of addressing today's problem, but ultimately anytime spent addressing future needs that are never realized is mostly wasted, apart from perhaps the learning opportunity.

## Pipelines

A [single pipeline](pipelines/deploy-xwc-app.yml) with separate stages for development and prod is used.

## OfflineMode TXT Record

Xerox have a mechanism that assists in users being able to continue printing, but relies on the Xerox client being able to perform a DNS resolution of a TXT record, which depending on the value, indicates the availability of the service.

If the TXT record’s value is ‘True’ then the client will show the cached printers and users can continue to print to cached printers using a standard print queue.

To make it happen via this repo, go to the terraform.tfvars in the respective environment e.g. dev/prod. You will find the variable `value_txt_record` which is set to FALSE by default.

This can be toggled to TRUE during a change to push patch updates or to perform maintenance on Xerox print servers.

Once changed to TRUE follow the normal PR process to get it reviewed and merged via the pipeline trigger. Once the update or maintenance exercise is completed this value should be reverted back to FALSE.
