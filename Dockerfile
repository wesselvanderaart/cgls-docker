FROM ubuntu:20.04

ARG CGLS_BIN=cgls_lin_5.5.5.bin

COPY ${CGLS_BIN} /tmp/

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y dbus \
    && apt-get clean \ 
    && useradd -s /bin/bash vrol \
    && /tmp/${CGLS_BIN} --auto \
    && rm /tmp/${CGLS_BIN} \
    && chown -R vrol:vrol /usr/ChaosGroup

USER vrol
COPY startup.sh chaos_cred.json /usr/ChaosGroup/VRLService/OLS/

EXPOSE 30304
CMD  /usr/ChaosGroup/VRLService/OLS/startup.sh /usr/ChaosGroup/VRLService/OLS/chaos_cred.json
