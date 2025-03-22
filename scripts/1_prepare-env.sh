#!/usr/bin/env bash

mkdir -p ./dags ./logs ./plugins ./config
docker compose up airflow-init
