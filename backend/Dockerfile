FROM python:3.12-slim

WORKDIR /gitearn/

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy poetry.lock* in case it doesn't exist in the repo
COPY ./pyproject.toml ./poetry.lock* /gitearn/

# Allow installing dev dependencies to run tests
ARG INSTALL_DEV=false
RUN bash -c "if [ $INSTALL_DEV == 'true' ] ; then poetry install --no-root ; else poetry install --no-root --only main ; fi"

ENV PYTHONPATH=/gitearn

COPY ./scripts/ /gitearn/

COPY ./alembic.ini /gitearn/

COPY ./prestart.sh /gitearn/

COPY ./tests-start.sh /gitearn/

COPY ./app /gitearn/app

# Expose port 80
EXPOSE 80

CMD ["python3" "-m" "uvicorn" "app.main:app" "--port" "80"]

