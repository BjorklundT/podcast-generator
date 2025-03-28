# Use the latest official Ubuntu image as the base
FROM ubuntu:latest

# Update packages and install Python, pip, Git, and venv
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create a virtual environment and install PyYAML in it
RUN python3 -m venv /venv \
    && /venv/bin/pip install --upgrade pip \
    && /venv/bin/pip install PyYAML

# Set environment path so the venv is used by default
ENV PATH="/venv/bin:$PATH"

# Copy the Python script into the container
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint shell script into the container
COPY entrypoint.sh /entrypoint.sh

# OPTIONAL: Make sure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Define the script to run when the container starts
ENTRYPOINT ["/entrypoint.sh"]
