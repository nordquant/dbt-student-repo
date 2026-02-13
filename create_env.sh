#!/bin/bash
# Interactive script to create .env and load environment variables
# Assumes private key is stored at ~/.keys/dbt_key.pem

ENV_FILE=".env"
KEYS_DIR="$HOME/.keys"
KEY_FILE="$KEYS_DIR/dbt_key.pem"

echo "Let's set up your environment"

# Ask for environment variables
read -p "Enter ACCOUNT: " ACCOUNT
read -p "Enter DATABASE: " DATABASE
read -p "Enter WAREHOUSE: " WAREHOUSE
read -p "Enter PRIVATE_KEY_PASSPHRASE: " PRIVATE_KEY_PASSPHRASE

# Check if key file exists
mkdir -p "$KEYS_DIR"
if [ ! -f "$KEY_FILE" ]; then
  echo "⚠️ Private key file not found at $KEY_FILE"
  echo "Please create your private key as dbt_key.pem in $KEYS_DIR before running dbt."
fi

echo
echo "Summary of variables:"
echo "ACCOUNT=$ACCOUNT"
echo "PRIVATE_KEY_PATH=$KEY_FILE"
echo "PRIVATE_KEY_PASSPHRASE=$PRIVATE_KEY_PASSPHRASE"
echo "DATABASE=$DATABASE"
echo "WAREHOUSE=$WAREHOUSE"

echo
read -p "Do you confirm these values? (y/n): " CONFIRM

if [ "$CONFIRM" = "y" ]; then
  cat > $ENV_FILE <<EOL
ACCOUNT=$ACCOUNT
PRIVATE_KEY_PATH=$KEY_FILE
PRIVATE_KEY_PASSPHRASE=$PRIVATE_KEY_PASSPHRASE
DATABASE=$DATABASE
WAREHOUSE=$WAREHOUSE
EOL

  echo ".env file created at $(pwd)/$ENV_FILE ✅"

  if [ -f ./load_env.sh ]; then
    source ./load_env.sh
    echo "Environment variables loaded ✅"
  else
    echo "load_env.sh not found ❌"
  fi
else
  echo "Operation cancelled ❌"
fi
