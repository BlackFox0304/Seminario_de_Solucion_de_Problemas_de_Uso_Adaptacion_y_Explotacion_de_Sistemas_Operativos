#!/bin/bash

# Función para pedir datos al usuario
obtener_datos() {
  echo -e "\tCREACIÓN Y CONFIGURACIÓN DE UNA MÁQUINA VIRTUAL\n"    
  read -p "Nombre de la máquina virtual: " NOMBRE_VM
  read -p "Tipo de sistema operativo: " TIPO_OS
  read -p "Número de CPUs: " CPUS
  read -p "Tamaño de RAM (en GB): " RAM_GB
  read -p "Tamaño de VRAM (en MB): " VRAM_MB
  read -p "Tamaño del disco duro (en GB): " DISCO_GB
  read -p "Nombre del controlador SATA: " NOMBRE_CTRL_SATA
  read -p "Nombre del controlador IDE: " NOMBRE_CTRL_IDE

  RAM_MB=$((RAM_GB * 1024))
  DISCO_MB=$((DISCO_GB * 1024))
  DISCO_PATH="$HOME/VirtualBox VMs/$NOMBRE_VM/${NOMBRE_VM}_disk.vdi"

  mkdir -p "$HOME/VirtualBox VMs/$NOMBRE_VM"

  echo -e "\n\n"
  read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
}

# Función para crear la VM
crear_vm() {
  VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_OS" --register
}

# Función para configurar CPU, RAM y VRAM
configurar_recursos() {
  VBoxManage modifyvm "$NOMBRE_VM" --cpus "$CPUS" --memory "$RAM_MB" --vram "$VRAM_MB"
}

# Función para configurar red NAT
configurar_red() {
  VBoxManage modifyvm "$NOMBRE_VM" --nic1 nat
}

# Función para crear y asignar disco duro
crear_disco_duro() {
  VBoxManage createhd --filename "$DISCO_PATH" --size "$DISCO_MB" --variant Standard
}

# Función para crear y configurar controlador SATA
crear_controlador_sata() {
  VBoxManage storagectl "$NOMBRE_VM" --name "$NOMBRE_CTRL_SATA" --add sata --bootable on
  VBoxManage storageattach "$NOMBRE_VM" --storagectl "$NOMBRE_CTRL_SATA" --port 0 --device 0 --type hdd --medium "$DISCO_PATH"
}

# Función para crear y configurar controlador IDE
crear_controlador_ide() {
  VBoxManage storagectl "$NOMBRE_VM" --name "$NOMBRE_CTRL_IDE" --add ide 
}

# Función para mostrar configuración final
mostrar_configuracion() {
  echo -e "\nResumen de configuración:"
  VBoxManage showvminfo "$NOMBRE_VM" --machinereadable | grep -E 'name|ostype|memory|vram|cpus|storagecontroller|sata|ide|medium|nic1|bridgeadapter1'
  echo -e "\n\nLa máquina virtual '$NOMBRE_VM' ha sido creada y configurada con éxito :)\n"
}

# Llamar funciones
obtener_datos
crear_vm
configurar_recursos
configurar_red
crear_disco_duro
crear_controlador_sata
crear_controlador_ide
mostrar_configuracion