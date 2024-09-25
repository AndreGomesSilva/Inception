FROM debian:oldstable

RUN apt-get update -y && \
    apt-get install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/mariadb.cnf

COPY ./tools/script.sh /tmp/script.sh

RUN chmod 777 /tmp/script.sh && bash /tmp/script.sh

CMD ["mysqld_safe"]

