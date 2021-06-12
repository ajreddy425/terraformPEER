# creating vpc1

resource "aws_vpc" "main1" {
  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc-01"
  }
}

# creating vpc02

resource "aws_vpc" "main2" {
  cidr_block       = "10.40.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc-02"
  }
}
