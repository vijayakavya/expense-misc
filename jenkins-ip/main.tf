terraform {
  backend "s3" {
    bucket  = "terraform-b26"
    key     = "misc/jenkins-ip/terraform.tfstate"
    region  = "us-east-1"
  }
}

data "aws_instance" "instance" {
  instance_id = "i-00404fb70d6d5c9f3"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.kdevopsb26.online"
  type    = "A"
  zone_id = "Z03665552INK97CUQ6WQD"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}


data "aws_instance" "artifactory" {
  instance_id = "i-0e77db2d5286c3701"
}

resource "aws_route53_record" "artifactory" {
  name    = "artifactory.kdevopsb26.online"
  type    = "A"
  zone_id = "Z03665552INK97CUQ6WQD"
  records = [data.aws_instance.artifactory.public_ip]
  ttl = 10
}