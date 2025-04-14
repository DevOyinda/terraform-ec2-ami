# terraform-ec2-ami
Mini project: terraform ec2 instancee and ami creation

# ☁️ Terraform EC2 Instance & AMI Creation

This mini project demonstrates how to use **Terraform** to:

- Provision an EC2 instance on AWS
- Create a custom Amazon Machine Image (AMI) from that instance

## 📁 Project Structure

.
├── main.tf          # Terraform configuration for EC2 & AMI creation
└── README.md        # Project documentation


---

## 📌 Description

This project:

- Creates an EC2 instance in the AWS `us-east-2` region (Ohio)
- Tags the instance with `Name = ExampleInstance`
- Creates a custom AMI (`terraform-my-ami`) from the instance **without rebooting**

---

## 🔧 Terraform Configuration Overview

### 🌍 Provider

```
provider "aws" {
  region = "us-east-2"
}
```

## Creating EC2 Instance: 

```
resource "aws_instance" "example_instance" {
  ami           = "ami-0100e595e1cc1ff7f"  # Make sure this AMI exists in us-east-2
  instance_type = "t2.micro"
  key_name      = "terraform-key-pair"

  tags = {
    Name = "ExampleInstance"
  }
}
```
## Create AMI from EC2 Instance
```
resource "aws_ami_from_instance" "example_ami" {
  name                    = "terraform-my-ami"
  description             = "Example AMI created with Terraform"
  source_instance_id      = aws_instance.example_instance.id
  snapshot_without_reboot = true
}
```
