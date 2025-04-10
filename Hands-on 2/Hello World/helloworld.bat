@echo off

REM Imprimir en pantalla “Hello World”
echo "Hello World"

REM Listar el contenido del directorio actual.
dir
echo "Directorio listado"

REM Crear un subdirectorio (folder) llamado Test
mkdir Test
echo "Folder creado"

REM Cambiarse al subdirectorio Test.
cd Test
echo "Cambiamos a Test"

REM Listar el contenido del subdirectorio Test. 
dir
echo "Directorio listado de Test"
pause