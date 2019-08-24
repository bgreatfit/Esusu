FROM python:3.7.4
# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /app

# Install python mysql client
RUN apt-get update \
    && apt-get -y install libmysqlclient-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

#RUN pip install --upgrade pip
#RUN pip install pipenv
#COPY ./Pipfile /app/Pipfile
#RUN pipenv install --skip-lock

#RUN pip install pipenv
#RUN pipenv install
# copy project

# copy entrypoint.sh
EXPOSE 8000

# copy project
COPY . /app/
# run entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]