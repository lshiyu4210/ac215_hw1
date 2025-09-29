# Base
FROM python:3.11-slim-bookworm

# Set environment variables
ENV UV_LINK_MODE=copy
ENV UV_PROJECT_ENVIRONMENT=/home/app/.venv

# Install system dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install uv
RUN pip install --no-cache-dir --upgrade pip && \
    pip install uv

# Create app directory and set as working directory
RUN mkdir -p /app
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN uv sync

# Set entrypoint to bash in the virtual environment
ENTRYPOINT ["/bin/bash", "-c", "source /home/app/.venv/bin/activate && exec bash"]
