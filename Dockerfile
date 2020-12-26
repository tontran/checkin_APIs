# Base Image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#RUN mkdir /code
#WORKDIR /code
#COPY ./requirements.txt /code/
#RUN pip install --upgrade pip
#RUN pip install -r requirements.txt
#COPY . /code/

# Set working directory
WORKDIR /Users/tontran/Desktop/python/dj_proj/vannails_checkin
COPY ./requirements.txt /Users/tontran/Desktop/python/dj_proj/vannails_checkin/
#COPY Pipfile Pipfile.lock /Users/tontran/Desktop/python/dj_proj/vannails_checkin/
#RUN pip install --upgrade pip
RUN pip install -r requirements.txt

## Install dependencies
#RUN pip install --upgrade pip
#RUN pip install -r requirements.txt

# Copy project
COPY . .

#EXPOSE $PORT
## Execute command
CMD python3 manage.py runserver
#CMD ["python", "./example.py"]