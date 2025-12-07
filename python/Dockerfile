FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Install system dependencies (optional: for psycopg2, etc.)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*


COPY python/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY python/__main__.py .

CMD [ "python3", "__main__.py" ]