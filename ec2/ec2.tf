
#resource "<resource-type>" "<resource-name>"
resource "aws_security_group" "using_security_group"{   #name used by terraform
    name = "using_security_group"
    description = "providing security group"

     ingress {
        from_port        = 0    #from 0 to 0 means all ports should be opened
        to_port          = 0
        protocol         = "tcp" # -1 means all protocols are allowed
        cidr_blocks      = ["0.0.0.0/0"]
    }

     egress {
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags ={
        Name = "using_security_group"
        CreatedBy = "Nagamani"
    }

}

resource "aws_instance" "first_tf_ec2_instance" {

    ami = "ami-090252cbe067a9e58"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.using_security_group.id]

    tags = {
        Name = "first_instance" #name used by AWS
        CreatedBy = "Nagamani"
    }

}