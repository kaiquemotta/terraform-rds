#!/bin/bash

# Imprimir as variáveis de ambiente para depuração
echo "Starting the script with the following environment variables:"
echo "DB_HOST = $DB_HOST"
echo "DB_PORT = $DB_PORT"
echo "DB_USER = $DB_USER"
echo "DB_PASS = $DB_PASS"
echo "DB_NAME = $DB_NAME"

# Variáveis de ambiente com valores padrão
DB_HOST=${DB_HOST:-"localhost"}
DB_PORT=${DB_PORT:-3306}
DB_USER=${DB_USER:-"root"}
DB_PASS=${DB_PASS:-"password"}
DB_NAME=${DB_NAME:-"my_database"}

# Separar o host e a porta, caso a porta esteja incluída no DB_HOST
HOST=$(echo $DB_HOST | cut -d':' -f1)
PORT=$(echo $DB_HOST | cut -d':' -f2)

# Se a porta não foi passada, usa o valor de DB_PORT
PORT=${PORT:-$DB_PORT}

# Comando para criar o banco de dados
mysql -h $HOST -P $PORT -u $DB_USER -p$DB_PASS -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"