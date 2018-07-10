
#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7

#BINARIES: Add in all necessary application binaries
COPY ./server.xml /config
COPY ./binary/application/* /config/dropins/
RUN mkdir /config/lib
COPY ./binary/lib/* /config/lib/

#FEATURES: Install any features that are required
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
&& rm -rf /var/lib/apt/lists/*
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense \
	jsp-2.3 \
	ejbLite-3.2 \
	servlet-3.1 \
	jsf-2.2 \
	beanValidation-1.1 \
	jndi-1.0 \
	cdi-1.2 \
	jdbc-4.1 \
	jpa-2.0 \
	javaMail-1.5 \
	el-3.0; exit 0

