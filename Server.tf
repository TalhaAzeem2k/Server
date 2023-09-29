# Define the AWS provider configuration
provider "aws" {
  region = "eu-north-1a" # Specify your desired AWS region
}

# Create a security group for the server
resource "aws_security_group" "server_security_group" {
  name        = "ServerSecurityGroup"
  description = "Security group for the server"
  
  # Define inbound rules to allow SSH access and other necessary ports
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # This should be restricted to trusted IPs in a production environment
  }
  
  # Add more ingress rules as needed
}

# Create an EC2 instance for the server
resource "aws_instance" "server_instance" {
  ami           = "ami-086ee6e5ed2ea3434" # Replace with the appropriate AMI ID
  instance_type = "t3.micro"     # Adjust as needed
  
  # Attach the security group created earlier
  security_groups = [ServerSecurityGroup]
  
  # Define the subnet where the server instance should be launched
  subnet_id = "subnet-0cf0ec734aaecdbd7" # Replace with the correct subnet ID
  
  # You can add more configuration settings like key_name, user_data, etc., here
}
