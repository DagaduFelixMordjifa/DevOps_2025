resource "aws_launch_template" "web" {
  name_prefix   = "web-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [aws_security_group.asg_sg.id]
  }

  user_data = base64encode(<<EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF
  )
}

resource "aws_autoscaling_group" "web" {
  vpc_zone_identifier = var.private_subnets
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [var.alb_target_group]
  health_check_type = "EC2"
}
