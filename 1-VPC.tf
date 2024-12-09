# this  makes  vpc.id which is aws_vpc.Australia_VPC.id
resource "aws_vpc" "Australia_VPC" {
  cidr_block = "10.104.0.0/16"

  tags = {
    Name    = "Australia_VPC"
    Service = "aussie_app"
    Owner   = "Crocodile_Dundee"
    Planet  = "Earth"
  }
}
