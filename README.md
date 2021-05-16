## Provision EKS Cluster with Terraform
Create a quick development grade `EKS` cluster using tf.

## Prerequisite

    * VPC
    * 2 AZ

## Sample Config

    * Create tfvar file with following config

    ```
    region       = "us-east-1"
    cluster_name = "jsarkarlabs-test"
    vpc_id       = "vpc-XXXXXXXXX"
    subnets      = [
                    "subnet-XXXXXXX",
                    "subnet-XXXXXXX",
                   ]
    ```

