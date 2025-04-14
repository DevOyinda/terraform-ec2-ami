provider "aws" {
  region = "us-east-2"  # Ohio region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0100e595e1cc1ff7f"  # Make sure this AMI exists in us-east-2
  instance_type = "t2.micro"
  key_name      = "terraform-key-pair"    # Make sure this key pair exists in us-east-2

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_ami_from_instance" "example_ami" {
  name               = "terraform-my-ami"
  description        = "Example AMI created with Terraform"
  source_instance_id = aws_instance.example_instance.id
  snapshot_without_reboot = true  # optional, avoids rebooting the instance
}
