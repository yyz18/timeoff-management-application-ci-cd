#Declare variables defined in terraform.tfvars
variable "web_cidr_blocks" {
  type = list(string)
}
variable "web_ami" {
  type = string
}
variable "web_instance_type" {
  type = string
}
variable "web_key_name" {
  type = string
}

#Specify AWS as the provider
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

#Use the default VPC
resource "aws_default_vpc" "default" {}

#Create a new security group to allow http, https, and ssh inbound and all outbound connections
resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allows http and https inboud and everything else outbounds"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.web_cidr_blocks
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.web_cidr_blocks
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.web_cidr_blocks
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.web_cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.web_cidr_blocks
  }
  
  tags = {
    "terraform" : "true"
  }
}

#Launch an EC2 instance and install Jenkins
resource "aws_instance" "prod_jenkins" {
  count         = 1

  ami           = var.web_ami
  instance_type = var.web_instance_type
  key_name      = var.web_key_name

  vpc_security_group_ids = [
    aws_security_group.prod_web.id
  ]
  user_data     = "${file("install_jenkins.sh")}"

  tags = {
   "terraform" : "true"
   "Name"      : "Jenkins-Server"
  }
}

#Launch an EC2 instance and install Ansible
resource "aws_instance" "prod_ansible" {
  count = 1

  ami           = var.web_ami
  instance_type = var.web_instance_type
  key_name      = var.web_key_name

  vpc_security_group_ids = [
    aws_security_group.prod_web.id
  ]
  user_data     = "${file("install_ansible.sh")}"

  tags = {
   "terraform" : "true"
   "Name"      : "Ansible-Server"
  }
}

#Launch an EC2 instance and install eksctl and kubectl
resource "aws_instance" "prod_terraform" {
  count = 1

  ami           = var.web_ami
  instance_type = var.web_instance_type
  key_name      = var.web_key_name

  vpc_security_group_ids = [
    aws_security_group.prod_web.id
  ]
  user_data     = "${file("install_kubernetes.sh")}"

  tags = {
   "terraform" : "true"
   "Name"      : "Kubernetes-Server"
  }
}
