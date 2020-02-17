FROM python:3.7.2-stretch as py3

FROM python:2.7.15-stretch as py2

FROM jenkins/jenkins:lts

USER root
COPY --from=py2 /usr/local/lib /usr/local/lib
COPY --from=py2 /usr/local/bin /usr/local/bin
COPY --from=py2 /usr/local/include /usr/local/include
COPY --from=py2 /usr/local/man /usr/local/man
COPY --from=py2 /usr/local/share /usr/local/share

COPY --from=py3 /usr/local/lib /usr/local/lib
COPY --from=py3 /usr/local/bin /usr/local/bin
COPY --from=py3 /usr/local/include /usr/local/include
COPY --from=py3 /usr/local/man /usr/local/man
COPY --from=py3 /usr/local/share /usr/local/share

RUN apt-get update
