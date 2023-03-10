FROM python:3.8-alpine

WORKDIR /app 

COPY requirements.txt ./

RUN apk update && \
    apk upgrade && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]