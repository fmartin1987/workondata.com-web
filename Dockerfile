FROM fmartin1987/centos67-python27-apache24:latest

# PIP Packages
RUN \
    yum install -y git openldap-devel python-devel postgresql-devel && \
    pip install virtualenv && \
    mkdir -p /var/www/virtualenvs && \
    virtualenv -p /usr/local/bin/python2.7 /var/www/virtualenvs/WorkOnData && \
    source /var/www/virtualenvs/WorkOnData/bin/activate && \
    pip install requests[security] && \
    pip install -Iv python-ldap==2.4.20 && \
    pip install -Iv django-auth-ldap==1.2.6 && \
    pip install -Iv django-compressor==1.5 && \
    pip install psycopg2 && \
    pip install -Iv pymongo==3.0.3 && \
    pip install -Iv pycrypto==2.6.1 && \
    pip install -Iv jira==1.0.7 && \
    pip install xmltodict && \
    pip install -Iv django-apptemplates==0.0.1 && \
    pip install -Iv django_smtp_ssl==1.0 && \
    pip install -Iv django-sendfile==0.3.9 && \
    pip uninstall -y django && \
    pip install -Iv django==1.8.4

# Entrypoint
ENV OPENSSL_PASS password
COPY files/deploy.sh.dat /
COPY files/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
