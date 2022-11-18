data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld-tf-practice-hs"
    Confidentiality = "C2"
    Author = "hemanshu.solanki@vodafone.com"
    TaggingVersion = "v2.3"
    Environment = "SANDBOX"
    ProjectName = "tf-practice-hs"
  }
}
