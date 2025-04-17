FROM python:3.13-alpine
ARG CYBERDROP_VERSION=6.8.0.post2
RUN apk update && apk add pipx gcc linux-headers python3-dev musl-dev bash
RUN pipx install cyberdrop-dl-patched==${CYBERDROP_VERSION}
RUN ln -s /root/.local/bin/cyberdrop-dl /usr/local/bin/cyberdrop-dl

WORKDIR /cyberdrop

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/cyberdrop-dl"]
