FROM httpd:2.4

# Copier le code source
COPY source/ /usr/local/apache2/htdocs/

# Copier la configuration du proxy
COPY proxy.conf /usr/local/apache2/conf/extra/proxy.conf

# Inclure la configuration du proxy dans httpd.conf
RUN echo "Include conf/extra/proxy.conf" >> /usr/local/apache2/conf/httpd.conf