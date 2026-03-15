# Docker container for puddletag
[![Release](https://img.shields.io/github/release/jlesage/docker-puddletag.svg?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-puddletag/releases/latest)
[![Docker Image Size](https://img.shields.io/docker/image-size/jlesage/puddletag/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/puddletag/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/jlesage/puddletag?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/puddletag)
[![Docker Stars](https://img.shields.io/docker/stars/jlesage/puddletag?label=Stars&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/puddletag)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jlesage/docker-puddletag/build-image.yml?logo=github&branch=master&style=for-the-badge)](https://github.com/jlesage/docker-puddletag/actions/workflows/build-image.yml)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-puddletag)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge)](https://paypal.me/JocelynLeSage)

This project provides a lightweight and secure Docker container for
[puddletag](https://docs.puddletag.net/index.html).

Access the application's full graphical interface directly from any modern web
browser - no downloads, installs, or setup required on the client side - or
connect with any VNC client.

The web interface also offers audio playback, seamless clipboard sharing, an
integrated file manager and terminal for accessing the container's files and
shell, desktop notifications, and more.

> This Docker container is entirely unofficial and not made by the creators of
> puddletag.

---

[![puddletag logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/puddletag-icon.png&w=110)](https://docs.puddletag.net/index.html)[![puddletag](https://images.placeholders.dev/?width=288&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=puddletag&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://docs.puddletag.net/index.html)

puddletag is an audio tag editor for GNU/Linux, similar to the
Windows program Mp3tag. Unlike most taggers for GNU/Linux, it uses a
spreadsheet-like layout, making all the tags you want to edit by hand visible
and easily editable.

---

## Quick Start

**NOTE**:
    The Docker command provided in this quick start is an example, and parameters
    should be adjusted to suit your needs.

Launch the puddletag docker container with the following command:
```shell
docker run -d \
    --name=puddletag \
    -p 5800:5800 \
    -v /docker/appdata/puddletag:/config:rw \
    -v /home/user:/storage:rw \
    jlesage/puddletag
```

Where:

  - `/docker/appdata/puddletag`: Stores the application's configuration, state, logs, and any files requiring persistency.
  - `/home/user`: Contains files from the host that need to be accessible to the application.

Access the puddletag GUI by browsing to `http://your-host-ip:5800`.
Files from the host appear under the `/storage` folder in the container.

## Documentation

Full documentation is available at https://github.com/jlesage/docker-puddletag.

## Support or Contact

Having troubles with the container or have questions? Please
[create a new issue](https://github.com/jlesage/docker-puddletag/issues).

For other Dockerized applications, visit https://jlesage.github.io/docker-apps.
