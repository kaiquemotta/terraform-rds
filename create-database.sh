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

# Imprimir o comando MySQL que será executado
echo "Executing command: mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS -e \"CREATE DATABASE IF NOT EXISTS $DB_NAME;\""

# Comando para criar o banco de dados
mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
