terraform {
  backend "s3" {
    bucket  = "mylocalterraform123"
    key     = "MyLinuxBox"
    region  = "us-east-1"
    encrypt = true
  }
}

