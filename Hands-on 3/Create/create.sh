#!/bin/bash

# Crear un archivo de texto plano llamado mytext y agregar la cadena “Hola Mundo”
echo "Hola Mundo" > mytext
echo "Archivo con texto creado"

# Imprimir en la terminal el contenido del archivo mytext
echo "Contenido de mytext:"
cat mytext

# Crear un Fichero llamado backup
mkdir backup
echo "Fichero backup creado"

# Mover el archivo mytext al Fichero backup
mv mytext backup/
echo "Se movió el archivo a backup"

# Listar el contenido del Fichero backup
echo "Contenido de backup:"
ls -l backup

echo "Presiona cualquier tecla para continuar..."
read -n 1 -s

# Eliminar el archivo mytext del Fichero backup
rm backup/mytext
echo "archivo mytext eliminado"

# Eliminar el Fichero backup
rmdir backup
echo "Fichero backup eliminado"