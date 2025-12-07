# Використовуємо офіційний Python 3.10 образ
FROM python:3.10-slim

# Встановлюємо робочу директорію
WORKDIR /

# Копіюємо файл з залежностями
COPY requirements.txt .

# Встановлюємо системні залежності для psycopg2
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Встановлюємо Python залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь код застосунку
COPY templates .

# Відкриваємо порт 8000
EXPOSE 8000

# Команда для запуску застосунку
CMD ["python", "main.py"]