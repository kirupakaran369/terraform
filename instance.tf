#Creating SG for instances

resource "aws_security_group" "task-1-sg" {
  name        = "task-1-sg"
  description = "sg for task-1 instances"
  vpc_id      = var.VPC_ID
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MY_IP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#Creating key pair for instances

resource "aws_key_pair" "task-1" {
  key_name   = "task-1"
  public_key = file(var.PUB_KEY_PATH)
}

#Creating instances

resource "aws_instance" "task-1" {
  ami                    = var.AMI[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.task-1.key_name
  vpc_security_group_ids = [aws_security_group.task-1-sg.id]
  user_data              = file("install_packages.sh")
  tags = {
    Name = "task-1-instance"
  }
  # provisioner "file" {
  #   source      = "install_packages.sh"
  #   destination = "/tmp/install_packages.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/install_packages.sh",
  #     "sudo /tmp/install_packages.sh ",
  #   ]
  # }
  connection {
    user        = var.USER
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
}