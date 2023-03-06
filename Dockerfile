FROM python:3.8-alpine

WORKDIR /app 

COPY requirements.txt ./

RUN apt-get update && \
    apt-get install -y && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080:80

CMD ["python", "./app.py"]