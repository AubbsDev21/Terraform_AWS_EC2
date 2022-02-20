
resource "aws_instance" "instance_server" {
  ami           = var.instance_ami
  instance_type = var.instance_size

  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.infra_env}-web"
    Environment = var.infra_env
  }
}



resource "aws_eip" "instance_IP" {
  vpc = true

  lifecycle {
    prevent_destroy = true

  }

  tags = {
    Name        = "${var.infra_env}-web"
    Environment = var.infra_env
  }

}

resource "aws_eip_association" "eip_assoc" {

  instance_id   = aws_instance.instance_server.id
  allocation_id = aws_eip.instance_IP.id
}

