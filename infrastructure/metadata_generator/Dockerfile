# docker build -t postgresql-metadata-generator .
FROM python:3.7

WORKDIR /lib
COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app

# Copy project files (see .dockerignore).
COPY . .

ENTRYPOINT ["python", "metadata_generator.py"]
