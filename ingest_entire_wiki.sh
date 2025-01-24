#! /usr/bin/env bash

# IMPORTANT
# Needs to be run from python venv

PORT=31415

# start ollama server
OLLAMA_HOST=0.0.0.0:$PORT ollama serve 2>&1 > /dev/null &

# ingest
folder_ingest="../repo_test_ambrosys_chatbot/data/wiki/Ambrosys-export/"
LOCAL_INGESTION_ENABLED=true PGPT_PROFILES=ollama python scripts/ingest_folder.py "$folder_ingest"

# kill ollama in background
kill $!
