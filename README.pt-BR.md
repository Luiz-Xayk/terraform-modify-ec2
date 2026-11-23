🇺🇸 [English](README.md) | 🇧🇷 [Português](README.pt-BR.md)

# Configuração de Infraestrutura AWS com Terraform – Alteração Agendada do Tipo de Instância EC2

Este repositório contém arquivos Terraform para configurar uma função Lambda, uma política IAM, uma função IAM e uma regra do EventBridge na AWS para modificar instâncias EC2.

## O Que Faz

Em um horário definido por uma regra do EventBridge, a função Lambda (Node.js, `lambda_function.js`):

1. Para a instância EC2 alvo.
2. Aguarda até que a instância esteja totalmente parada.
3. Altera o tipo da instância.
4. Inicia a instância novamente.

A região, o ID e o novo tipo da instância são passados para a função no input do evento do EventBridge.

## Estrutura de Arquivos

- `provider.tf`: Configura o provedor AWS e a região.
- `iam_policy.tf`: Define a política IAM para as permissões necessárias.
- `iam_role.tf`: Cria a função IAM e associa a política.
- `lambda_function.tf`: Configura a função Lambda com o código e as variáveis de ambiente.
- `eventbridge.tf`: Define a regra do EventBridge para acionar a função Lambda.
- `lambda_function.js`: Código-fonte da função Lambda.

## Como Usar Este Repositório

### Clonar o Repositório

Para usar este repositório, clone o projeto para o seu ambiente local:

```bash
git clone https://github.com/Luiz-Xayk/terraform-modify-ec2.git
cd terraform-modify-ec2
```

### Editar Variáveis

Antes de aplicar as configurações do Terraform, edite os arquivos `.tf` conforme necessário, especialmente para configurar valores como região da instância EC2, ID da instância e tipo da instância:

- Em `lambda_function.tf`, substitua os valores de `INSTANCE_REGION`, `INSTANCE_ID` e `INSTANCE_TYPE` pelos dados reais da sua instância EC2 ou configure-os como variáveis Terraform.
- Em `eventbridge.tf`, substitua os placeholders do `input` do target (`instanceRegion`, `instanceId`, `instanceType`) e ajuste a expressão `cron(...)` conforme desejado.
