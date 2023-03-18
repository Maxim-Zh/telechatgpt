FROM python:3.10-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache \
    postgresql-client \
    libffi-dev \
    gcc libc-dev \
    postgresql-dev python3-dev musl-dev

WORKDIR /app/deploy
COPY Pipfile Pipfile.lock ./
RUN pip install --upgrade pip
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile

RUN apk del --no-cache \
    postgresql-dev \
    gcc \
    libc-dev \
    libffi-dev \
    python3-dev \
    musl-dev

COPY ./docker/startup/wait_db.sh /startup/
RUN chmod a+x /startup/*

WORKDIR /app/src

ENTRYPOINT ["sh", "/startup/wait_db.sh"]
