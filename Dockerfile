FROM rocker/tidyverse:3.6.2

#Change Source List for China GeoLocation
#RUN printf "deb http://ftp2.cn.debian.org/debian/ buster main \\ deb http://ftp2.cn.debian.org/debian/ buster-updates main" > /etc/apt/sources.list

#Instal webshot
RUN R -e "install.packages('webshot',repos='https://cloud.r-project.org/')"
#Install PhantomJS dependencies
RUN apt-get update
RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y --no-install-recommends build-essential apt-utils chrpath libssl-dev libxft-dev 
#Install Fonts
RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y --no-install-recommends libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev fonts-wqy-zenhei 
#Install PhantomJS
COPY phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv phantomjs-2.1.1-linux-x86_64 /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
#Copy Rscripts
COPY app /home/rstudio/app
#Change Locale to Chinese
RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y --no-install-recommends locales locales-all
ENV LC_ALL zh_CN.UTF-8

#Go to ~/app and execute webshot_script.R, the png will be in your home directory