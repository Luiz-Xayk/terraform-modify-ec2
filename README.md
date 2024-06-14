# Configuração de Infraestrutura AWS com Terraform

Este repositório contém arquivos Terraform para configurar uma função Lambda, uma política IAM, uma função IAM e uma regra do EventBridge na AWS para modificar instâncias EC2.

## Estrutura de Arquivos

- `provider.tf`: Configura o provedor AWS e a região.
- `iam_policy.tf`: Define a política IAM para as permissões necessárias.
- `iam_role.tf`: Cria a função IAM e associa a política.
- `lambda_function.tf`: Configura a função Lambda com o código e as variáveis de ambiente.
- `eventbridge.tf`: Define a regra do EventBridge para acionar a função Lambda.

## Como Usar Este Repositório

### Clonar o Repositório

Para usar este repositório, clone o projeto para o seu ambiente local:

```bash
git clone https://github.com/Luiz-Xayk/terraform-modify-ec2.git
cd terraform-modify-ec2
```

# Editar Variáveis
Antes de aplicar as configurações do Terraform, edite os arquivos .tf conforme necessário, especialmente para configurar variáveis como região da instância EC2, ID da instância e tipo da instância:

- Em lambda_function.tf, substitua os valores de INSTANCE_REGION, INSTANCE_ID e INSTANCE_TYPE pelas suas instâncias EC2 reais ou configure como variáveis Terraform.
