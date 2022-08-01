# CloudFormation Templates
Example Cloudformation templates to build web application

## Template Order

### Tags (tags.yml)

Creates CF Stack that holds tagging information to be utilize by various templates in order to keep data consistent
without relying on copy and pasting values as parameters.

### VPC (vpc.yml)

Creates VPC, Subnets, and other networking resources. Requires **vpc-subnet.yml** to be uploaded to S3 Bucket.

#### Parameters

* **TagsStackName** Stack Name for Tags ([tags.yml](#tags-tagsyml))
* **NumberSubnets** Number of Subnets to create
* **SubnetTemplateUrl** S3 URL of the VPC Subnet CF Template

### Launch Template (launchtemplate.yml)

Creates Launch Template for new EC2 instances. Also creates EC2 Security Group for them

#### Parameters
* **TagsStackName** Stack Name for Tags ([tags.yml](#tags-tagsyml))
* **VpcStackName** Stack Name for VPC ([vpc.yml](#vpc-vpcyml))
* **InstanceType** EC2 Instance Type. Defaults to *t2.micro*
* **KeyName** EC2 Key Pair name for SSH. Must be created already

### Auto Scaling Group (autoscaling-grouo.yml)

Creates autoscaling and target groups

#### Parameters
* **TagsStackName** Stack Name for Tags ([tags.yml](#tags-tagsyml))
* **VpcStackName** Stack Name for VPC ([vpc.yml](#vpc-vpcyml))
* **LaunchTemplateStackName** Stack Name for Launch Template ([launchtemplate.yml](#launch-template-launchtemplateyml))
* **NumberSubnets** Number of subnets to use
* **GroupMinSize** Minimum number of instances in Auto Scaling Group
* **GroupMaxSize** Maximum number of instances in Auto Scaling Group

### Load Balancer (load-balancer.yml)

Creates an Application Load Balancer and related resources

#### Parameters
* **TagsStackName** Stack Name for Tags ([tags.yml](#tags-tagsyml))
* **VpcStackName** Stack Name for VPC ([vpc.yml](#vpc-vpcyml))
* **LaunchTemplateStackName** Stack Name for Launch Template ([launchtemplate.yml](#launch-template-launchtemplateyml))
* **AutoscalingGroupStackName** Stack Name for Auto Scaling Group ([autoscaling-group.yml](#auto-scaling-group-autoscaling-grouoyml))
* **NumberSubnets** Number of subnets to use

### Web Application Firewall (waf.yml)

Creates WAF

#### Parameters
* **TagsStackName** Stack Name for Tags ([tags.yml](#tags-tagsyml))

### Cloudfront (cloudfront.yml)

Creates Cloudfront Distribution and related policies

#### Parameters
* **TagsStackName** Stack Name for Tags ([tags.yml](#tags-tagsyml))
* **ElbStackName** Stack Name for ELB ([load-balancer.yml](#load-balancer-load-balanceryml))
* **WafStackName** Stack Name for WAF ([waf.yml](#web-application-firewall-wafyml))