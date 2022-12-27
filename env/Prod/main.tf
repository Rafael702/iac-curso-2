#As variaveis declaradas na infra receberao o seu valor aqui.
module "aws-prod" {
  source = "../../infra"
  ami = "ami-0b0d54b52c62864d6"
  instancia  = "t2.micro"
  regiao_aws = "sa-east-1"
  chave = "Iac-prod"
}

output "IP_Prod" {
  value = module.aws-prod.IP_publico
}
