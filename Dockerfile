# Base image
FROM python:3.9-slim

# Environment settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only required folders
COPY src/ ./src
COPY model/ ./model
COPY data/ ./data

# Default command
CMD ["python", "src/predict.py"]
