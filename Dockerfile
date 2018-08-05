FROM avkosme/centos

ADD assets/nginx.repo.sh /opt/nginx.repo.sh
RUN /bin/bash -c 'chmod +x /opt/nginx.repo.sh'
RUN /opt/./nginx.repo.sh

RUN yum -y update
RUN yum install -y nginx

RUN yum clean all
RUN rm -rf /var/cache/yum


RUN /bin/bash -c 'mkdir -p /etc/nginx/sites-enabled/'
COPY assets/sites-enabled/* /etc/nginx/sites-enabled/

RUN systemctl enable nginx.service
