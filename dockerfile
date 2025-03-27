# Use the latest official Ubuntu image as the base
from ubuntu:latest

# Update packages and install Python, pip, and Git
run apt-get update && apt-get install -y \
    python3.10 \         # Python interpreter
    python3-pip \        # Python package manager
    git                  # Version control system

# Install the PyYAML library using pip
run pip3 install PyYAML

# Copy the Python script into the container
copy feed.py /usr/bin/feed.py

# Copy the entrypoint shell script into the container
copy entrypoint.sh /entrypoint.sh

# OPTIONAL: Make sure the entrypoint script is executable
run chmod +x /entrypoint.sh

# Define the script to run when the container starts
entrypoint ["/entrypoint.sh"]