resource "aws_security_group" "Australia-sg01-tg01" {
  name        = "Australia-sg01-tg01"
  description = "Australia-sg01-tg01"
  vpc_id      = aws_vpc.Australia_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MyEvilBox"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Syslog_Server"
    from_port   = 514
    to_port     = 514
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name    = "Australia-sg01-tg01"
    Service = "aussie_app"
    Owner   = "Crocodile_Dundee"
    Planet  = "Earth"
  }

}





resource "aws_security_group" "Australia-sg02-LB01" {
  name        = "Australia-sg02-LB01"
  description = "Australia-sg02-LB01"
  vpc_id      = aws_vpc.Australia_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Australia-sg02-LB01"
    Service = "aussie_app"
    Owner   = "Crocodile_Dundee"
    Planet  = "Earth"
  }

}

