FROM python:3.11.6-slim

WORKDIR /app

# Copiar solo los archivos de dependencias para aprovechar la caché
COPY pyproject.toml poetry.lock /app/

# Instalar Poetry sin usar caché
RUN pip install --no-cache-dir poetry

# Configurar Poetry para evitar la creación de entornos virtuales
RUN poetry config virtualenvs.create false

# Instalar solo las dependencias principales (sin dev)
RUN poetry install --only=main --no-interaction --no-ansi

# Copiar el resto del código de la aplicación
COPY . /app/

# Ejecutar el script principal
CMD ["python", "main.py"]
