@echo off

REM Crear un archivo de texto plano llamado mytext.txt agregando a dicho archivo la cadena “Hola Mundo”
echo Hola Mundo > mytext.txt
echo "Archivo con contenido creado"

REM Imprimir el contenido del archivo mytext.txt
echo "Contenido de mytext.txt: "
type mytext.txt

REM Crear una subdirectorio (folder) llamado backup
mkdir backup
echo "Folder creado"

REM Copiar el archivo mytext.txt al subdirectorio backup
copy mytext.txt backup\
echo "Archivo copiado"

REM Listar el contenido del subdirectorio backup
dir backup
echo "Directorio listado"
pause 

REM Eliminar el archivo mytext.txt del subdir backup
del backup\mytext.txt
echo "Archivo eliminado"

REM Eliminar el folder backup
rmdir backup
echo "Folder eliminado"
pause