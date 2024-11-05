#!/bin/bash

# Obtener el ID del proyecto actual
PROJECT_ID=$(gcloud config get-value project)

# Verificar si se obtuvo un ID de proyecto
if [ -z "$PROJECT_ID" ]; then
  echo "No se pudo obtener el ID del proyecto. Asegúrate de que tienes un proyecto configurado en gcloud."
  exit 1
fi

# Obtener la región predeterminada (si no tiene una configurada, asignar una por defecto)
REGION=$(gcloud config get-value compute/region)

if [ -z "$REGION" ]; then
  echo "No se configuró una región. Usando la región por defecto: us-central1"
  REGION="us-central1"  # Región por defecto
fi

# Mostrar el ID del proyecto y la región
echo "ID del Proyecto: $PROJECT_ID"
echo "Región: $REGION"