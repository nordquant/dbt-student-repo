#!/bin/bash
# Script para cargar variables desde .env

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
  echo "Variables are loaded from .env ✅"
else
  echo "Count not find .env ❌"
fi
