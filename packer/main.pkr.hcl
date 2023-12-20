source "amazon-ebs" "appimage" {
  ami_name      = local.image-name
  source_ami = var.ami
  instance_type = "t2.micro"
  ssh_username = "ec2-user"
  tags  = {
Name = local.image-name
project = var.project
env = var.env
}
}

build {
  name    = "Build- AMI"
  sources = [
    "source.amazon-ebs.appimage"
  ]

 provisioner "shell" {
   script = "./setup.sh"
execute_command = "sudo {{.Path}}"
}

provisioner "file" {
source = "../website"
destination = "/tmp/"
}

# provisioner "shell" {
 #   script = "./setup.sh"
#execute_command = "sudo {{.Path}}"
#}


provisioner "shell" {
inline = ["sudo cp -r /tmp/website/* /var/www/html/","chown -R apache:apache /var/www/html/*","sudo rm -rf /tmp/website"]
}
}
