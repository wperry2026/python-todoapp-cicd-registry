# base image: OS + libraries preinstalled 
# Sourced from either Docker Hub or AWS Elastic Container Registry or Azure Container Registry, or Google Container Registry or custom build image
FROM python:3.12-slim

# Set working directory in the container
WORKDIR /app

# Copy from local host computer to container into current working directory
COPY . .

# install dependencies (this happens during image build and is one off operation)
RUN pip install --no-cache-dir -r requirements.txt

# exposes the port
EXPOSE 5000

# runs the code in the container (in container: permanent process)
CMD ["python", "app.py"]

# 1. build image (one template)
# 2. run container (living, many of them)

# Difference between RUN and CMD:
# RUN is executed during image build time to install application dependencies
# CMD is executed when the container starts to run the application

# Difference between CMD and Entrypoint:
# CMD provides default arguments for the entrypoint (can be overridden at runtime)
# Entrypoint specifies the command to run when the container starts (cannot be overridden at runtime)

# Difference between Image and Container:
# Image is a template (read-only) that contains the application and its dependencies
# Container is a running instance of an image (read-write) that can be started, stopped, and deleted
