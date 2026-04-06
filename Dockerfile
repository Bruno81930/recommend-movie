FROM ubuntu:latest as build-image-base

WORKDIR /recommended_movie

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install -yq \
    curl \
    g++ \
    gcc \
    make \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    python-is-python3 \
   && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]