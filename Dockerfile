FROM coqorg/coq:8.6

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y coqide

ENTRYPOINT "coqide"
