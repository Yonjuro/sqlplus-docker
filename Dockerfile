FROM fedora

RUN yum install alien -y \
    && yum install wget -y \
    && yum install traceroute -y \
    && yum install libaio -y \
    && yum install libnsl -y \
    && mkdir oracle \
    && cd oracle \
    && wget https://download.oracle.com/otn_software/linux/instantclient/193000/oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm \
    && wget https://download.oracle.com/otn_software/linux/instantclient/193000/oracle-instantclient19.3-sqlplus-19.3.0.0.0-1.x86_64.rpm \
    && rpm -ivh oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm \
    && rpm -ivh oracle-instantclient19.3-sqlplus-19.3.0.0.0-1.x86_64.rpm \
    && printf '\n###Sqlplus Client###\nexport ORACLE_HOME=/usr/lib/oracle/12.2/client64\nexport LD_LIBRARY_PATH=${ORACLE_HOME}/lib\nexport PATH=${ORACLE_HOME}/bin:$PATH\n' >> ~/.bashrc
