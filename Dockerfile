FROM python:3.6
# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /app

# Install python mysql client
RUN apt-get update \
    && apt-get -y install libmysqlclient-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
RUN  curl -sL https://deb.nodesource.com/setup_12.x |  bash
RUN apt-get install -y nodejs


# install dependencies
COPY /app/requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY /app/package.json /app/
RUN npm install

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
COPY /app/ /app/
# run entrypoint.sh
COPY app/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
#CMD ["sh","/entrypoint.sh"]