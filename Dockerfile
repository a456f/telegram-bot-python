FROM python:3.11.6-slim

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN pip install --no-cache-dir poetry

RUN poetry --version  # Aquí se imprime la versión

RUN poetry config virtualenvs.create false

RUN poetry install --only=main --no-interaction --no-ansi

COPY . /app/

CMD ["python", "main.py"]
