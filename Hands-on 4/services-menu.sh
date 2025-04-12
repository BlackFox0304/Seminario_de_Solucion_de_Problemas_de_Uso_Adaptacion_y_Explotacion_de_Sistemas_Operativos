#!/bin/bash

# Función para listar contenido de una carpeta (se le preguntará al usuario por la ruta) 
listar_contenido() {
  echo ""
  read -p "Ingresa la ruta absoluta del directorio: " ruta
  if [ -d "$ruta" ]; then
    echo "Contenido Listado: "
    ls -l "$ruta"
  else
    echo -e "\n La ruta no es válida o no existe :("
  fi
}

# Función para crear un archivo con una línea de texto (se le preguntará al usuario por el texto y el nombre del archivo)
crear_archivo() {
  echo ""
  read -p "Ruta y nombre del archivo: " archivo
  read -p "Ingresa la línea de texto a guardar: " texto
  echo "$texto" > "$archivo"
  echo -e "\n Archivo creado :)"
}

# Función para comparar dos archivos de texto 
comparar_archivos() {
  echo ""
  read -p "Ingresa la ruta del primer archivo: " archivo_1
  read -p "Ingresa la ruta del segundo archivo: " archivo_2
  if [ -f "$archivo_1" ] && [ -f "$archivo_2" ]; then
    diff "$archivo_1" "$archivo_2"
  else
    echo -e "\n No se encontraron los archivos :("
  fi
}

# Función Concatenar columnas de un csv con awk (y guardarlo en un archivo)
concatenar_columnas() {
  echo ""
    read -p "Ingresa la ruta del archivo CSV:" archivo_csv

    if [[ -f "$archivo_csv" ]]; then
        read -p "Ingresa la ruta y nombre del archivo nuevo (extensión .txt)" archivo_salida

        awk -F',' 'NR>1 { printf "#%s %s - %s [%s] Nivel: %s | Habilidad: %s\n", $1, $2, $3, $4, $5, $6 }' "$archivo_csv" > "$archivo_salida"
        echo -e "\n Archivo guardado correctamente :)"
    else
        echo -e "\nNo se encontró el archivo :("
    fi
}

# Función para buscar una palabra y resaltarla con color usando grep (se le preguntará al usuario por la palabra y el archivo .txt)
buscar_palabra() {
  echo ""
  read -p "Ingresa la ruta del archivo: " archivo
  read -p "Ingresa la palabra a buscar: " palabra
  if [ -f "$archivo" ]; then
    grep --color=always -i -w -n "$palabra" "$archivo"
  else
    echo -e "\n No se encontró el archivo :("
  fi
}


# Menú principal
while true; do
  echo -e "\n\t\tMENÚ DE OPCIONES"
  echo "1) Listar contenido de una carpeta"
  echo "2) Crear un archivo con una línea de texto"
  echo "3) Comparar dos archivos de texto"
  echo "4) Concatenar columnas de un csv y guardarlo en un txt (con awk)"
  echo "5) Buscar y resaltar una palabra en un archivo (con grep)"
  echo -e "6) Salir\n"
  read -p "Selecciona una opción: " opcion

  case $opcion in
    1) listar_contenido ;;
    2) crear_archivo ;;
    3) comparar_archivos ;;
    4) concatenar_columnas ;;
    5) buscar_palabra ;;
    6) echo -e "\n Adiós :)"; exit ;;
    *) echo -e "\n La opción ingresada no es válida :(" ;;
  esac
done