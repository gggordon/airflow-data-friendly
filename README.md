# Airflow -  Data Friendly Containers

## Overview

**@Author:** [gggordon](https://github.com/gggordon)

This is modified and configurable [airflow setup using docker compose](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html) that includes common providers and configurations for Data Analytics/ Engineering activities.



## About

This [`docker-compose.yml`](./docker-compose.yml) file contains several service definitions:

-   `airflow-scheduler` - The [scheduler](https://airflow.apache.org/docs/apache-airflow/stable/administration-and-deployment/scheduler.html) monitors all tasks and DAGs, then triggers the task instances once their dependencies are complete.
    
-   `airflow-webserver` - The webserver is available at `http://localhost:8080`.
    
-   `airflow-worker` - The worker that executes the tasks given by the scheduler.
    
-   `airflow-triggerer` - The triggerer runs an event loop for deferrable tasks.
    
-   `airflow-init` - The initialization service.
    
-   `postgres` - The database.
    
-   `redis` - [The redis](https://redis.io/) - broker that forwards messages from scheduler to worker.
    

Optionally, you can enable flower by adding `--profile flower` option, e.g. `docker compose --profile flower up`, or by explicitly specifying it on the command line e.g. `docker compose up flower`.

-   `flower` - [The flower app](https://flower.readthedocs.io/en/latest/) for monitoring the environment. It is available at `http://localhost:5555`.
    

All these services allow you to run Airflow with [CeleryExecutor](https://airflow.apache.org/docs/apache-airflow-providers-celery/stable/celery_executor.html "(in apache-airflow-providers-celery v3.10.0)"). For more information, see [Architecture Overview](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/overview.html).

Some directories in the container are mounted, which means that their contents are synchronized between your computer and the container.

-   `./dags` - you can put your DAG files here.
    
-   `./logs` - contains logs from task execution and scheduler.
    
-   `./config` - you can add custom log parser or add `airflow_local_settings.py` to configure cluster policy.
    
-   `./plugins` - you can put your [custom plugins](https://airflow.apache.org/docs/apache-airflow/stable/authoring-and-scheduling/plugins.html) here.
    

This file uses the latest Airflow image ([apache/airflow](https://hub.docker.com/r/apache/airflow)). If you need to install a new Python library or system library, you can [build your image](https://airflow.apache.org/docs/docker-stack/index.html "(in docker-stack vdevel)").


## Usage


### Initializing Environment
Before starting Airflow for the first time, you need to prepare your environment, i.e. create the necessary files, directories and initialize the database.

1. Copy the [sample.env](./sample.env) to `.env` and update the defaulr variables. See `docker-compose.yml` for additional details and usage
2. Run `./scripts/1_prepare-env.sh` from the root directory

You should have the airflow dag and configuration folders in your base directory and container images created/available after running step 2.

### Running

This will start the docker containers and have the airflow webserver available on port 8080 by default. You may log in and use airflow.

1. Run `./scripts/2_run.sh`

### Stopping

This will stop all related docker containers

1. Run `./scripts/3_stop.sh`

### Tear down/Cleanup

This will remove all related containers, volumes and images.

1. Run `./scripts/3_teardown.sh`

