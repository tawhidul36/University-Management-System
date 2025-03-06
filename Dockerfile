# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install PostgreSQL development tools
RUN apt-get update && apt-get install -y libpq-dev

# Copy the current directory contents into the container at /app
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 8000

# Set the environment variables for Django
ENV PYTHONUNBUFFERED=1

# Run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
