resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Australia_VPC.id

  tags = {
    Name    = "Australia_VPC_IGW"
    Service = "aussie_app"
    Owner   = "Crocodile_Dundee"
    Planet  = "Earth"
  }
}

