# docker build -t postgresql-db-cleaner .
FROM python:3.7

WORKDIR /lib
COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app

# Copy project files (see .dockerignore).
COPY . .

ENTRYPOINT ["python", "cleanup_db.py"]
