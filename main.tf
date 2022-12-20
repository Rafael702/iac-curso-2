//Especificacao do provedor
terraform {
  required_providers { //provedores necessarios para criar a nossa instancia.
    aws = {
      source  = "hashicorp/aws" //provider para acessar a aws.
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
    ami           = "ami-0ecc74eca1d66d8a6" // Imagem do sistema
    instance_type = "t2.micro"
    key_name      = "iac-alura"
    # user_data = <<-EOF
    #               #!/bin/bash
    #               cd  /home/ubuntu
    #               echo "<h1>Feito com Terraform</h1>" > index.html
    #               nohup busybox httpd -f -p 8080 &
    #               EOF
    
    //Nome que podemos dar para a nossa instancia
    tags = {
        Name = "Terraform Ansible Python"
    }
}

resource "aws_key_pair" "chaveSSH"{
  key_name = DEV
  public_key = file("Iac-Dev.pub")
}