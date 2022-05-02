FROM python:3.9-alpine

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

WORKDIR /app

COPY . .

HEALTHCHECK CMD wget --no-verbose --tries=1 --spider  http://localhost:5000 || exit 1

CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]