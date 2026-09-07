# Code-Insight-AI-IaC

Este es el repositorio de infraestructura como código (IaC) de Code Insight AI. Aprovisiona en AWS todos los recursos necesarios para ejecutar el backend, el worker de análisis y el hosting del frontend del sistema. Aplicando diferentes conceptos como:

- Infraestructura como código con Terraform y módulos reutilizables
- Red virtual privada (VPC) con subredes públicas y privadas, Internet Gateway y NAT Gateway
- Cómputo serverless con AWS Lambda (función de API y worker) desplegado dentro de la VPC
- Procesamiento asíncrono con Amazon SQS y event source mapping hacia el worker
- API REST con Amazon API Gateway en modo proxy hacia Lambda
- Persistencia con Amazon DynamoDB en modo bajo demanda (PAY_PER_REQUEST)
- Hosting estático del frontend con Amazon S3 privado + CloudFront usando Origin Access Control (OAC)
- Invocación de modelos de IA con Amazon Bedrock mediante permisos IAM de mínimo privilegio
- Autenticación federada para CI/CD con GitHub OIDC y roles IAM asumibles desde GitHub Actions
- Nombrado y etiquetado consistente de todos los recursos por proyecto y ambiente

## Requisitos Previos

Asegúrate de tener instalado y configurado lo siguiente:

- Terraform: [Descargar Terraform](https://developer.hashicorp.com/terraform/install) (versión >= 1.9.0)
- AWS CLI: [Descargar AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Credenciales de AWS válidas exportadas en el entorno o configuradas con `aws configure`
- Una cuenta de AWS con permisos para crear los recursos (VPC, Lambda, API Gateway, SQS, DynamoDB, S3, CloudFront, IAM)
- El paquete de despliegue del backend (`lambda-package.zip`) generado desde el [Repositorio Backend Code Insight AI](https://github.com/juparefe/code-insight-ai-backend)

Lenguajes utilizados: HCL (HashiCorp Configuration Language)

Proveedores, herramientas o servicios utilizados: Terraform, AWS Provider (hashicorp/aws ~> 6.0), Amazon VPC, AWS Lambda, Amazon API Gateway, Amazon SQS, Amazon DynamoDB, Amazon S3, Amazon CloudFront, AWS IAM, Amazon Bedrock, GitHub OIDC

## Scripts Disponibles

- Inicializar Terraform y descargar proveedores: `terraform init`
- Formatear el código: `terraform fmt -recursive`
- Validar la configuración: `terraform validate`
- Previsualizar los cambios: `terraform plan`
- Aplicar la infraestructura: `terraform apply`
- Destruir la infraestructura: `terraform destroy`

## Variables de Entrada

| Variable | Descripción | Valor por defecto |
| --- | --- | --- |
| `aws_region` | Región de AWS donde se despliega la infraestructura | `us-east-1` |
| `project_name` | Nombre del proyecto usado para nombrar y etiquetar recursos | `code-insight-ai` |
| `environment` | Ambiente de despliegue | `dev` |
| `lambda_package_path` | Ruta al paquete de despliegue de la Lambda | *(obligatoria, sin valor por defecto)* |
| `api_integration_timeout_milliseconds` | Timeout de la integración API Gateway -> Lambda en ms | `29000` |

Los valores del proyecto se definen en `terraform.tfvars`, que se mantiene versionado en este repositorio.

## Módulos

| Módulo | Recursos que aprovisiona |
| --- | --- |
| `networking` | VPC, subredes públicas y privadas, Internet Gateway, NAT Gateway, tablas de rutas y asociaciones |
| `security` | Security Group para las funciones Lambda |
| `iam` | Rol de ejecución de Lambda y políticas (Bedrock, SQS, DynamoDB), proveedor GitHub OIDC y rol de despliegue del frontend |
| `sqs` | Cola `analysis-jobs` para los trabajos de análisis |
| `dynamodb` | Tabla `analysis-jobs` en modo bajo demanda |
| `lambda` | Función de API, función worker y event source mapping SQS -> worker |
| `api_gateway` | API REST, recurso proxy, métodos, integraciones, deployment, stage y permiso de invocación de Lambda |
| `frontend` | Bucket S3 privado, política de bucket, bloqueo de acceso público, Origin Access Control y distribución CloudFront |

## Salidas (Outputs)

Al terminar `terraform apply` se muestran, entre otros:

- `api_endpoint`: URL pública del API Gateway
- `frontend_cloudfront_domain_name`: dominio de CloudFront del frontend
- `frontend_bucket_name`: bucket S3 del frontend
- `analysis_jobs_queue_url` / `analysis_jobs_table_name`: cola y tabla de trabajos de análisis
- `vpc_id`, `public_subnet_ids`, `private_subnet_ids`: identificadores de red

## Paso a paso para ejecutar el repositorio

Para poder utilizar este repositorio debes seguir estas instrucciones. Ten en cuenta que primero debes dirigirte al [Repositorio Backend Code Insight AI](https://github.com/juparefe/code-insight-ai-backend) y generar el paquete `lambda-package.zip`, ya que la Lambda se despliega a partir de ese artefacto.

1. Clonar el repositorio en el entorno local utilizando el comando:
   ```
   git clone https://github.com/juparefe/code-insight-ai-iac.git
   ```
2. Abrir la carpeta clonada utilizando algún editor de código.
3. Autenticarse en AWS exportando credenciales válidas en la terminal o ejecutando:
   ```
   aws configure
   ```
4. Ajustar el archivo `terraform.tfvars` para que `lambda_package_path` apunte al `lambda-package.zip` generado en el repositorio backend.
5. Inicializar Terraform y descargar los proveedores:
   ```
   terraform init
   ```
6. Previsualizar los cambios que se van a aplicar:
   ```
   terraform plan
   ```
7. Aplicar la infraestructura y confirmar con `yes` cuando lo solicite:
   ```
   terraform apply
   ```
8. Al finalizar, Terraform imprime los outputs con las URLs y los identificadores de los recursos creados.

Para eliminar toda la infraestructura creada por este repositorio ejecuta `terraform destroy`.

## Notas

- El estado de Terraform (`terraform.tfstate`) se maneja de forma local y está excluido del control de versiones. Consérvalo o migra a un backend remoto (por ejemplo S3 + DynamoDB) para trabajo en equipo.
- La creación del NAT Gateway y de la primera Lambda dentro de subredes nuevas puede tardar varios minutos.
- El NAT Gateway y la distribución de CloudFront generan costos mientras la infraestructura esté desplegada.
