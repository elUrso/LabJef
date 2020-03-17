FROM ubuntu

# Set some flags
ARG DEBIAN_FRONTEND=noninteractive

# Get system up to date
RUN apt update
RUN apt upgrade -y

# Get packages
RUN apt install python python-pip lsb-release sudo wget vim -y

# Install Postgresql
RUN echo deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt update
RUN apt install postgresql-9.6 libpq-dev -y

# Create the project user
RUN adduser --disabled-password --shell /bin/bash --quiet --gecos "" bcc
RUN echo "bcc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/bcc

# Switch user

CMD bash

# needs to install psycopg2
# service postgresql start < next steps...