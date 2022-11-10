# syntax=docker/dockerfile:1
FROM ubuntu
RUN apt-get update && apt-get install -y \
g++ \
curl \
&& curl https://apt.releases.teleport.dev/gpg -o /usr/share/keyrings/teleport-archive-keyring.asc \
&& echo "deb [signed-by=/usr/share/keyrings/teleport-archive-keyring.asc] https://apt.releases.teleport.dev/ubuntu jammy stable/v11" | tee /etc/apt/sources.list.d/teleport.list > /dev/null \
&& apt-get update \
&& apt-get install -y teleport
COPY teleport.yaml /etc/
