provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_key_pair" "personal" {
  key_name = "dean_macbook_key"
  public_key = file("~/.ssh/no_password_key/id_rsa.pub")
}

resource "aws_instance" "example" {
  ami           = var.amis[var.infrastructure_type[var.environment]]
  instance_type = var.instances[var.infrastructure_type[var.environment]]
  key_name = aws_key_pair.personal.key_name
  security_groups = ["personal_pc"]

  connection {
     type     = "ssh"
     user     = "ubuntu"
     private_key = file("~/.ssh/no_password_key/id_rsa")
     host     = self.public_ip
   }

   provisioner "local-exec" {
    command = "sleep 100; scp -i ~/.ssh/no_password_key/id_rsa -r ~/.kaggle ubuntu@${self.public_dns}:~/.kaggle"
   }

   provisioner "file" {
    source      = var.remote_provision_script[var.infrastructure_type[var.environment]]
    destination = "/tmp/provision_script.sh"
   }

   provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/provision_script.sh",
       "/tmp/provision_script.sh",
     ]
    }
}

output "ip" {
  value = aws_instance.example.public_ip
}

output "public_dns" {
  value = aws_instance.example.public_dns
}
