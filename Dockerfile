ARG PYTHON_VERSION=3.12
ARG ALPINE_VERSION=3.22

#use python 3.12 - alpine as base image
FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

# Diable pycache
ENV PYTHONDONTWRITEBYTECODE=1
# Disbale buffering
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN adduser \
    --disbale password \
    --home "/nonexistent" \ 
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "10001" \
    pythonuser

USER pythonuser

COPY . .

EXPOSE 8000

CMD [ "python3", "-m", "uvicorn", "app:app" , "host=0.0.0.0", "port=8000" ]