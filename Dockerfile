FROM python:3.11.6-slim

WORKDIR /app
COPY . /app

# Instalar Poetry y verificar la versión
RUN pip install --no-cache-dir poetry && poetry --version

# Configurar Poetry para evitar la creación de entornos virtuales
RUN poetry config virtualenvs.create false

# Instalar solo las dependencias principales (sin dev)
RUN poetry install --only=main --no-interaction --no-ansi

# Ejecutar el script principal
CMD ["python", "main.py"]
