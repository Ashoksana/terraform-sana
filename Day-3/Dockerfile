FROM httpd:latest

WORKDIR /sateesh

RUN apt update -y && \
    apt install -y nano unzip wget && \
    rm -rf /usr/local/apache2/htdocs/* && \
    wget -O applight.zip https://www.free-css.com/assets/files/free-css-templates/download/page295/applight.zip && \
    unzip applight.zip -d /sateesh && \
    mv /sateesh/Applight/* /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd-foreground"]