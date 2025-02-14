FROM python:3.11.6-slim

WORKDIR /app

# Copiar solo los archivos de dependencias primero (para aprovechar caché)
COPY pyproject.toml poetry.lock /app/

# Instalar Poetry sin caché y verificar la versión
RUN pip install --no-cache-dir poetry && poetry --version

# Configurar Poetry para evitar entornos virtuales
RUN poetry config virtualenvs.create false

# Instalar solo las dependencias principales (sin dev)
RUN poetry install --only=main --no-interaction --no-ansi

# Copiar el resto de los archivos
COPY . /app/

# Ejecutar el script principal
CMD ["python", "main.py"]
