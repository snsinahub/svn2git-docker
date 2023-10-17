FROM centos:7

RUN mkdir /app
WORKDIR /app
# RUN rm -rf /var/cache/dnf

# COPY ./redhat.repo /etc/yum.repos.d/redhat.repo
RUN mkdir -p /app/repos
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum repolist enabled
RUN ls -la /etc/yum.repos.d/
# RUN rm -f /etc/yum.repos.d/ubi.repo
# RUN yum update -y
RUN yum install --nogpgcheck -y git-core git-svn ruby
RUN gem install svn2git3

COPY ./svnToGit /app

# CMD /bin/bash
ENTRYPOINT ["tail", "-f", "/dev/null"]

