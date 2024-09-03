resource "aws_key_pair" "deployer" {
  key_name   = "suhail"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP8peH0elP9rhvlj7sTUTd5JWvnQ/89rXh3271MdeVsl suhailmenda@debian.local"
}

resource "aws_instance" "ec2" {
  instance_type = "t2.micro"
  ami = "ami-066784287e358dad1"
  subnet_id = var.subnetId
  associate_public_ip_address = var.public_ip
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = var.Name
  }
}

