# workondata.com-web

Django 1.8.4 with several extra modules:
   * python-ldap
   * djago-auth-ldap
   * django-compressor
   * psycopg2
   * pymongo
   * jira
   * xmltodict
   * django-apptemplates
   * django_smtp_ssl
   * django-sendfile
   
Local PSQL

Encrypted deploy.sh file to obtain portal source code and deploy it under Apache 2.4
Use OPENSSL_PASS environment variable to decrypt it. Otherwise the container won't start
