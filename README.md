# CloudFormation Templates
Example Cloudformation templates to build web application

## Template Order

### tags.yml

Creates CF Stack that holds tagging information to be utilize by various templates in order to keep data consistent
without relying on copy and pasting values as parameters.

### vpc.yml

Creates VPC, Subnets, and other networking resources. Requires **vpc-subnet.yml** to be uploaded to S3 Bucket.

#### Parameters

* **TagsStackName** Stack Name for Tags ([tags.yml](#tagsyml))
* **NumberSubnets** Number of Subnets to create
* **SubnetTemplateUrl** S3 URL of the VPC Subnet CF Template