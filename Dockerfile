FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install dbt-core + postgres adapter
RUN pip install --no-cache-dir dbt-core dbt-postgres

# Set working directory
WORKDIR /usr/app

# Default command
CMD ["dbt"]

