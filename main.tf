
resource "aws_instance" "Dev_App_Server" {
  ami = "${var.ami}"
  instance_type = "${var.instance1}"
  key_name = "${var.Dev_PublicKey}"
  vpc_security_group_ids = ["${aws_security_group.Dev_App_Server_SG.name}"]
  user_data = "${data.template_file.ec2_userdata.rendered}"
  tags {
    Name = "Dev_App_Server"
  }
}

resource "aws_security_group" "Dev_App_Server_SG" {
  name = "Dev_App_Server_SG"
  description = "create a security group for Dev App Server"
  vpc_id= "vpc-8fe2dde8"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress{
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
        egress{
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}

data "template_file" "ec2_userdata" {
  template = "${file("ec2_userdata.tmpl")}" 
}
