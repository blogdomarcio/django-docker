FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD python manage.py collectstatic --noinput

COPY ./entrypoint.sh /
CMD ["sh", "/entrypoint.sh"]
