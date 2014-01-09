#!/bin/bash

# Installs PostgreSQL and configures it so that no user is needed for login.

set -e

sudo apt-get install postgresql

printf '\nSet the password for user postgres:\n'
echo "    ALTER USER postgres WITH ENCRYPTED PASSWORD 'passwd';"
sudo -u postgres psql template1

# peer > md5
sudo sed -i "s/^\(local *all *postgres *\)peer/\1md5/" /etc/postgresql/9.1/main/pg_hba.conf

sudo /etc/init.d/postgresql restart

printf '\nCreating a new super user\n\n'
echo 'warning: first two prompts are new user password,
               the third prompt is for postgres password'
username=`whoami`
createuser -U postgres -d -e -E -l -P -r -s $username

# peer > md5
sudo sed -i "s/^\(local *all *all*\)peer/\1md5/" /etc/postgresql/9.1/main/pg_hba.conf

sudo /etc/init.d/postgresql restart


printf '\nYou may login now, example:\n'
echo '    psql template1'
