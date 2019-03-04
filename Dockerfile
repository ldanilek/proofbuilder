FROM coqorg/coq:8.9

RUN sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y libgtksourceview2.0-dev

RUN ["/bin/bash", "--login", "-c", "set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam update -y -u \
  && opam install -y coqide \
  && opam clean -a -c -s --logs \
  && opam config list && opam list"]

RUN sudo apt-get update && \
  sudo apt-get upgrade -y && \
  sudo apt-get install -y vim

CMD ["bash"]
