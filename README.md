Armageddon Project: Australia VPC Contribution
	This repository contains the Terraform configuration files for the California VPC Module, a component of the global Armageddon Project. This initiative supports the deployment of the J-Tele-Doctor application for Tokyo 	Midtown Medical Center (TMMC), ensuring scalable, secure, and compliant infrastructure in the Australia region.

Project Overview
	The Armageddon Project aims to expand telemedicine services for Japanese and international customers by deploying robust, secure application hosting across global AWS regions. The California VPC Module specifically supports the application hosting requirements in the Australia region, ensuring compliance with project-specific guidelines.

Features of the California VPC Module
	Networking
		VPC CIDR Block: 10.104.0.0/16 (65,536 IP addresses for future scalability)
		Subnets:
			Public:
				10.104.1.0/24 (AZ 1) (ap-southeast-2a)
				10.104.2.0/24 (AZ 2) (ap-southeast-2b)
				10.104.3.0/24 (AZ 3) (ap-southeast-2c)
			Private (Syslog Data & Backend Instances):
				10.104.11.0/24 (AZ 1) (ap-southeast-2a)
				10.104.12.0/24 (AZ 2) (ap-southeast-2b)
				10.104.13.0/24 (AZ 3) (ap-southeast-2c)
			Internet Gateway: Provides connectivity for public resources.
			NAT Gateway: Secures internet access for private subnets.
			**I found that I could only use 1a and 1c for public and private as b was not allowed. Some trouble shooting was required
	Compute
		Auto Scaling Group (ASG):
			Minimum: 3 Instances
			Maximum: 9 Instances
			Desired: 6 Instances
			Multi-AZ Deployment for Fault Tolerance
		EC2 Instances:
			Instance Type: t2.micro (for test deployment)
			AMI: Amazon Linux 2
	Security
		Security Groups:
			Inbound: Allow HTTP traffic on Port 80.
			Outbound: Enable required application traffic.
		Private Subnets: Isolate syslog data storage.
	Routing
		Public Subnet: Default route to Internet Gateway.
		Private Subnet: Default route to NAT Gateway.
	Outputs
		VPC ID and Subnet IDs
		Load Balancer DNS for Application Access
	Compliance and Benefits
				Requirement								Australia VPC Contribution
		Deploy ASG with a minimum of 2 AZs						Configured ASG spans two AZs with redundancy.
		Deploy at least 1 EC2 for testing						Includes one t2.micro instance for testing.
		Transfer syslog data securely							Isolated syslog data in private subnets, ready for transfer.
		Open only Port 80								Security groups restrict public access to Port 80.
		Store syslog data in private subnets						Ensures compliance with data privacy requirements.
	Value Proposition
		The California VPC Module delivers:
			Fault Tolerance: Multi-AZ deployment.
			Scalability: Auto Scaling adapts to traffic demands.
			Security: Strict compliance with syslog isolation and private subnet usage.
