FROM rocker/tidyverse:3.6.2

#Change Source List for China GeoLocation
#RUN printf "deb http://ftp2.cn.debian.org/debian/ buster main \\ deb http://ftp2.cn.debian.org/debian/ buster-updates main" > /etc/apt/sources.list

#Instal webshot
RUN R -e "install.packages('webshot',repos='https://cloud.r-project.org/')"
#Install PhantomJS
#RUN apt-get update
RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y --no-install-recommends build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev 
#RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y --no-install-recommends phantomjs
COPY phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv phantomjs-2.1.1-linux-x86_64 /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
COPY app /app
RUN R -e 'source("/app/webshot_script.R")'

