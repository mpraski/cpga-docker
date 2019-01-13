FROM debian:buster
RUN mkdir -p /app
RUN mkdir -p /install
COPY caf-binary.deb /install
RUN dpkg -i /install/caf-binary.deb

