#! /usr/bin/env bash

# IMPORTANT
# Needs to be run from python venv

PORT=31415

# start ollama server
OLLAMA_HOST=0.0.0.0:$PORT ollama serve 2>&1 > ollama.log &

# run private-GPT
PGPT_PROFILES=ollama make run 2>&1 | tee private_gpt.log
