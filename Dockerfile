FROM mono:onbuild
MAINTAINER venantvr

# Paramètres et variables d'environnement
ARG urlToCallEvery2Seconds=toto
ARG someOtherUrl=toto

ENV urlToCallEvery2Seconds=${urlToCallEvery2Seconds}
ENV someOtherUrl=${someOtherUrl}

# Variables locales (à compléter...)
ENV folder=/usr/src/app/build/
ENV startUp=${folder}launcher.sh

# Copie des scripts
COPY Scripts/configure.sh ${folder}
COPY Scripts/welcome.sh ${folder}

# Droits d'exécution des scripts
RUN chmod +x ${folder}configure.sh
RUN chmod +x ${folder}welcome.sh

# Installation xmlstarlet
RUN apt-get update
RUN apt-get -y install xmlstarlet

# Configuration et démarrage du conteneur
RUN export executable=$(ls --format single-column ${folder}*.exe) && \
 	echo ${folder}configure.sh > ${startUp} && \
 	echo mono ${executable} >> ${startUp} && \
	chmod +x ${startUp}

# Message d'accueil affichant la configuration
RUN echo ${folder}welcome.sh >> /etc/bash.bashrc
RUN echo Hello, $(ls --format single-column ${folder}*.exe) will start on boot from ${startUp} ! 

# Pour tests...
# CMD ["/bin/sh", "-c", "${folder}configure.sh"]

# Démarrage mise à jour configuration et service
ENTRYPOINT ["/bin/sh", "-c", "${startUp}"]

# Suppression xmlstarlet
# RUN apt-get -y remove xmlstarlet

EXPOSE 5678

