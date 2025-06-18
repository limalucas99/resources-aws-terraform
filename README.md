# ☁️ Infraestrutura Martiello Serverless com Terraform

Este projeto define a infraestrutura da parte de **Serverless** do projeto **Martiello** utilizando **Terraform**, estruturado de forma modular. Todo o provisionamento é realizado sobre a **AWS**, utilizando práticas de infraestrutura como código (IaC).

---

## 📁 Estrutura do Projeto

```bash
├── bootstrap                 # Módulo de inicialização do backend remoto (S3 + DynamoDB)
│   ├── main.tf
│   └── providers.tf  
└── environments
    └── prod                # Ambiente de produção
       ├── backend.tf       # Define o backend remoto (usa o S3 do bootstrap)
       ├── main.tf          # Composição da infraestrutura
       ├── providers.tf
       └── modules
           ├── api-gateway  # Módulo do API Gateway REST
           ├── cognito      # Módulo de autenticação com Cognito
           └── lambda       # Módulo com a função Lambda
```

## 🚀 Como executar o projeto

### 🔑 Pré-requisitos

Antes de tudo, você precisa garantir que:

- [Terraform](https://developer.hashicorp.com/terraform/install) esteja instalado
- Uma conta AWS válida configurada localmente
- Permissões para criar os recursos: S3, Lambda, Cognito e API Gateway

---

### 🔐 Configuração de Credenciais AWS

O Terraform utilizará o **perfil de credenciais padrão** da AWS localizado em: ~/.aws/credentials

Esse arquivo deve conter algo como:

```ini
[default]
aws_access_key_id = SUA_ACCESS_KEY
aws_secret_access_key = SUA_SECRET_KEY
aws_session_token = SEU_SESSION_TOKEN
```

## 🧱 Etapa 1 – Bootstrap do Backend (obrigatória)

O projeto foi desenhado com um **backend remoto**, armazenando o `terraform.tfstate` em um bucket S3.

**⚠️ Esse passo deve ser executado apenas uma vez por ambiente/workspace (ex: prod, staging).**

### ✅ Execute o bootstrap:

```bash
cd bootstrap
terraform init
terraform apply --auto-approve
```
Isso criará os recursos necessários para armazenar o estado remoto

## 🌐 Etapa 2 – Criar Infraestrutura do Ambiente

Após o bootstrap, vá para a pasta do workspace de produção.

```b̀ash
cd environments/prod
terraform init
terraform apply --auto-approve
```

**Aqui o Terraform irá:**

- Usar o backend definido no backend.tf (que aponta para o S3 criado no **bootstrap**)

- Criar na AWS os recursos definidos nos módulos:

     - Cognito 

     - Lambda (Referenciando o Cognito)

     - API Gateway (Integrado com a Lambda)






