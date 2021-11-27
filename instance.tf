resource "aws_instance" "inst" {
    ami = "${var.ami}"
    instance_type = "${var.itype}"
    # VPC
    subnet_id = "${aws_subnet.dev-subnet-public-1.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    # the Public SSH key
    key_name = "${var.keyname}"
    user_data = <<EOF
            #!/bin/bash
            sudo yum install httpd -y
            sudo service httpd restart
            echo "<h1>Hello this is RajiniL and I would like to join Xylem</h1>"| sudo tee /var/www/html/index.html
    EOF
    }
// Sends your public key to the instance
