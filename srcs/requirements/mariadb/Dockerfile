FROM debian:oldstable

ARG WP_ADMIN_USR
ARG WP_ADMIN_PWD
ARG DB_NAME

RUN apt-get update -y && \
    apt-get install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.conf
RUN chmod 644 /etc/mysql/my.cnf

COPY ./tools/script.sh /tmp/script.sh

RUN chmod 777 /tmp/script.sh && bash /tmp/script.sh

CMD ["mysqld_safe"]

