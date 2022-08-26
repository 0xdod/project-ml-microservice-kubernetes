[![CircleCI](https://dl.circleci.com/status-badge/img/gh/0xdod/project-ml-microservice-kubernetes/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/0xdod/project-ml-microservice-kubernetes/tree/master)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
4. Run prediction `./make_prediction.sh`

### Kubernetes Steps

#### Setup and Configure Docker locally
Follow the steps from the official [documentation](https://docs.docker.com/desktop/) to install and setup docker for your operating system.

#### Setup and Configure Kubernetes locally
If you use docker desktop, you can enable kubernetes in the settings, or follow the guide [here](https://minikube.sigs.k8s.io/docs/start/) to install minikube and setup a kubernetes cluster on your local system

#### Create Flask app in Container
Build and push the flask app image to docker hub
```bash
./run_docker.sh
./upload_docker.sh
```
#### Run via kubectl
run the following commands to get the container running in kubernetes
```bash
./run_kubernetes.sh
```
Open a new terminal to test the deployment and run the following commands
```bash
./make_prediction.sh
```

## Description of files 
* app.py: main entrypoint for application
* docker_out.txt: output of container's log after making a predicction
* Dockerfile: contains all the commands a user could call on the command line to assemble an image
* kubernetes_out.txt: output of kubernetes deployment pod after making prediction
* make_prediction.sh: contains command to interact with the running app to make a sample prediction request
* Makefile: contains commands for convenience to setup, lint and test our app
* requirements.txt: contains list of external python dependencies
* run_docker.sh: contains commands to run docker image
* run_kubernetes.sh: contains commands to deploy app to a kubernetes cluster
* upload_docker.sh: contains commands to upload docker image to docker hub
