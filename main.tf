
resource "aws_instance" "Dev_App_Server" {
  ami = "${var.ami}"
  instance_type = "${var.instance1}"
  key_name = "Dev App Key"
  vpc_security_group_ids = ["${aws_security_group.Dev_App_Server_instance.id}"]
  user_data = "${data.template_file.ec2_userdata.rendered}"
  tags {
    Name = "Dev_App_Server"
  }
}

resource "aws_security_group" "Dev_App_Server_instance" {
  name = "Dev_App_Server_Web"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "ec2_userdata" {
  template = "${file("ec2_userdata.tmpl")}" 
}
