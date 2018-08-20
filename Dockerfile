FROM fmartin1987/centos67-python27-apache24:latest

# PIP Packages
RUN \
    yum install -y git openldap-devel postgresql-server.x86_64 python-devel postgresql-devel --nogpgcheck && \
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib && \
    pip install requests[security] && \
    pip install -Iv python-ldap==2.4.20 && \
    pip install -Iv django-auth-ldap==1.2.6 && \
    pip install -Iv django-compressor==1.5 && \
    pip install psycopg2 && \
    pip install -Iv pymongo==3.0.3 && \
    pip install -Iv jira==1.0.7 && \
    pip install xmltodict && \
    pip install -Iv django-apptemplates==0.0.1 && \
    pip install -Iv django_smtp_ssl==1.0 && \
    pip install -Iv django-sendfile==0.3.9 && \
    pip uninstall -y django && \
    pip install -Iv django==1.8.4

# PostgreSQL
RUN \
    [[ ! -e "/var/lib/pgsql/data/pg_hba.conf" ]] && service postgresql initdb && \
    sed -i 's/ident/trust/g' /var/lib/pgsql/data/pg_hba.conf

# Entrypoint
ENV OPENSSL_PASS password
COPY files/deploy.sh.dat /
COPY files/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
