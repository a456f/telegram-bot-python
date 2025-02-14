# Usar una imagen ligera de Python
FROM python:3.11.6-slim

# Definir el directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios primero (mejora la cacheabilidad de Docker)
COPY pyproject.toml poetry.lock /app/

# Instalar Poetry de manera eficiente
RUN pip install --no-cache-dir poetry

# Configurar Poetry para evitar la creación de entornos virtuales
RUN poetry config virtualenvs.create false

# Instalar dependencias antes de copiar el código completo
RUN poetry install --only=main --no-interaction --no-ansi

# Ahora copiar el resto del código de la aplicación
COPY . /app

# Comando para ejecutar el script principal
CMD ["python", "main.py"]
