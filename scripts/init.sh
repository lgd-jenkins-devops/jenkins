#!/bin/bash

# Obtener el ID del proyecto actual
PROJECT_ID=$(gcloud config get-value project)

# Verificar si se obtuvo un ID de proyecto
if [ -z "$PROJECT_ID" ]; then
  echo "No se pudo obtener el ID del proyecto. Asegúrate de que tienes un proyecto configurado en gcloud."
  exit 1
fi

# Obtener la región predeterminada
REGION=$(gcloud config get-value compute/region)

# Verificar si se obtuvo una región
if [ -z "$REGION" ]; then
  echo "No se pudo obtener la región. Asegúrate de que tienes una región configurada en gcloud."
  exit 1
fi

# Mostrar el ID del proyecto y la región
echo "ID del Proyecto: $PROJECT_ID"
echo "Región: $REGION"