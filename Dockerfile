FROM python:3.12-alpine
ARG CYBERDROP_VERSION=6.4.0
RUN apk update && apk add pipx gcc python3-dev musl-dev
RUN pipx install cyberdrop-dl-patched==${CYBERDROP_VERSION}
# This will inject a working version of this module, may not always be needed
RUN pipx inject cyberdrop-dl-patched aiolimiter>=1.1.0 --force
RUN ln -s /root/.local/bin/cyberdrop-dl /usr/local/bin/cyberdrop-dl

WORKDIR /cyberdrop

ENTRYPOINT ["tail", "-f", "/dev/null"]
