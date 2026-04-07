#!/bin/bash
yum update -y
yum install -y postgresql-server postgresql-contrib
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql

sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgrespassword';"
echo "Postgres installed. Password for postgres user: postgrespassword"