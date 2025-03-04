# Use Python base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy necessary files
COPY requirements.txt requirements.txt
COPY app.py app.py
COPY templates templates
COPY static static
COPY inventory.csv inventory.csv

# Install dependencies
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
