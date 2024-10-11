# Usa la imagen base oficial de NGINX
FROM nginx:alpine

# Elimina el archivo de configuración por defecto de NGINX
RUN rm /usr/share/nginx/html/*

# Copia el archivo index.html y styles.css desde el directorio actual al directorio de NGINX
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Exponer el puerto 80 para que el servidor sea accesible
EXPOSE 80

# Comando por defecto para ejecutar NGINX en primer plano
CMD ["nginx", "-g", "daemon off;"]
