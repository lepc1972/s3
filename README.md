# S3 AWS 


# Despliegue Automático de Página Estática en S3 con GitHub Actions

Este repositorio está configurado para desplegar automáticamente una página estática en un bucket de Amazon S3 utilizando GitHub Actions. Cada vez que se realice un `push` a la rama `main`, GitHub Actions construirá y desplegará el contenido en el bucket S3 configurado.

## Requisitos Previos

Antes de comenzar, asegúrate de tener los siguientes elementos configurados:

1. **Bucket S3** configurado para hosting de sitios web estáticos.
2. **Credenciales de AWS (Access Key y Secret Key)** con permisos para acceder y actualizar el bucket S3.
3. **Repositorio GitHub** donde se aloja el código de tu página estática.
4. **Secrets de GitHub** para almacenar las credenciales de AWS.

### 1. Configuración del Bucket S3

1. Crea un bucket en Amazon S3:
   - Accede a la consola de AWS y navega a S3.
   - Crea un bucket (por ejemplo, `mi-sitio-estatico`) en la región `us-east-2`.
   - En la pestaña **Propiedades**, habilita el **hosting de sitio web estático** y configura la página de inicio (por ejemplo, `index.html`).

2. Configura los permisos de acceso público:
   - Ve a la pestaña **Permisos** del bucket y asegúrate de que el bucket permita acceso público para que los usuarios puedan ver la página.
   - Añade una política de bucket para permitir acceso público a los archivos:

   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Sid": "PublicReadGetObject",
               "Effect": "Allow",
               "Principal": "*",
               "Action": "s3:GetObject",
               "Resource": "arn:aws:s3:::mi-sitio-estatico/*"
           }
       ]
   }

