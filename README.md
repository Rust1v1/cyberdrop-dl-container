# Cyberdrop-DL Containerized

![Container Build Status](https://img.shields.io/github/actions/workflow/status/Rust1v1/cyberdrop-dl-container/build-image.yaml)
[![Docs](https://img.shields.io/badge/docs-wiki-blue?link=https%3A%2F%2Fscript-ware.gitbook.io%2Fcyberdrop-dl)](https://script-ware.gitbook.io/cyberdrop-dl)
![License](https://img.shields.io/github/license/Rust1v1/cyberdrop-dl-container)

A Container for [Cyberdrop-DL-Patched](https://github.com/jbsparrow/CyberDropDownloader). This container allows you to easily run cyberdrop-dl anywhere without worrying about python version / dependencies.

---

## Features
- **Easy Configuration**: Bind mount a directory to store configuration and downloads.
- **Lightweight**: Minimal Container image.
- **Cross-Platform**: Works on any system that supports Docker/Podman.

---

## Prerequisites
- Container Engine installed on your system.
- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Podman](https://podman.io/docs/installation)

---

## Quick Start

### Docker
`docker run --name cyberdrop -it -v <path/to/your/cb/downloads>:/cyberdrop:rw ghcr.io/rust1v1/cyberdrop-dl:latest`

### Podman
`podman run --name cyberdrop --rm -it -v <path/to/your/cb/downloads>:/cyberdrop:rw ghcr.io/rust1v1/cyberdrop-dl:latest`

## Volume Mounting

This container expects that you will provide a downloads folder from your machine. This can either be a preconfigured cyberdrop-dl configuration or an empty folder.

You must bind mount it into the /cyberdrop path inside the container. Upon starting the container it will either have you create a config or create on for you.
