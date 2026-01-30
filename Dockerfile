FROM python:3.13-alpine
ARG CYBERDROP_VERSION=9.0.0
ARG INSTALL_FFMPEG=false
RUN apk update && apk add --no-cache pipx gcc linux-headers python3-dev musl-dev bash
RUN if [ "${INSTALL_FFMPEG}" = "true" ]; then apk add --no-cache ffmpeg; fi
RUN pipx install cyberdrop-dl-patched==${CYBERDROP_VERSION}
RUN ln -s /root/.local/bin/cyberdrop-dl /usr/local/bin/cyberdrop-dl

ENV EDITOR=/usr/bin/vi

WORKDIR /cyberdrop

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/cyberdrop-dl"]
