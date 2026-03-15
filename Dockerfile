#
# puddletag Dockerfile
#
# https://github.com/jlesage/docker-puddletag
#

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define software versions.
ARG PUDDLETAG_VERSION=2.5.0

# Define software download URLs.
ARG PUDDLETAG_URL=https://github.com/puddletag/puddletag/archive/refs/tags/${PUDDLETAG_VERSION}.tar.gz

# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.23-v4.11.2

# Define working directory.
WORKDIR /tmp

ARG PUDDLETAG_URL
ARG DOCKER_IMAGE_VERSION

# Install dependencies.
RUN \
    add-pkg \
        py3-qt5 \
        py3-audioread \
        py3-certifi \
        py3-charset-normalizer \
        py3-configobj \
        py3-idna \
        py3-levenshtein \
        py3-lxml \
        py3-mutagen \
        py3-pyacoustid \
        py3-parsing \
        py3-rapidfuzz \
        py3-requests \
        py3-unidecode \
        py3-urllib3 \
        chromaprint \
        # File manager. \
        pcmanfm \
        adwaita-icon-theme \
        # To play audio files.
        ffmpeg \
        ffplay \
        # Needed for dark mode support.
        adwaita-qt \
        # Need a font.
        font-dejavu \
        && \
    # Fix for pcmanfm using "tab-new" icon, missing in Adwaita and hicolor themes.
    add-pkg mate-icon-theme && \
    cp /usr/share/icons/mate/16x16/actions/tab-new.png /usr/share/icons/hicolor/16x16/actions/ && \
    cp /usr/share/icons/mate/22x22/actions/tab-new.png /usr/share/icons/hicolor/22x22/actions/ && \
    cp /usr/share/icons/mate/24x24/actions/tab-new.png /usr/share/icons/hicolor/24x24/actions/ && \
    del-pkg mate-icon-theme && \
    gtk-update-icon-cache /usr/share/icons/hicolor && \
    true

# Install puddletag.
RUN \
    # Install packages needed by the build.
    add-pkg --virtual build-dependencies \
        curl \
        py3-uv \
        py3-setuptools \
        && \
    # Download the puddletag package.
    echo "Downloading puddletag..." && \
    mkdir /tmp/puddletag && \
    curl -L -# ${PUDDLETAG_URL} | tar xz --strip 1 -C /tmp/puddletag && \
    echo "Installing puddletag..." && \
    uv pip install /tmp/puddletag --system --no-deps --break-system-packages && \
    # Cleanup.
    del-pkg build-dependencies && \
    rm -rf /tmp/* /tmp/.[!.]*

# Generate and install favicons.
RUN \
    APP_ICON_URL=https://github.com/jlesage/docker-templates/raw/master/jlesage/images/puddletag-icon.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Add files.
COPY rootfs/ /

# Set internal environment variables.
RUN \
    set-cont-env APP_NAME "puddletag" && \
    set-cont-env APP_VERSION "$PUDDLETAG_VERSION" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    true

# Define mountable directories.
VOLUME ["/storage"]

# Metadata.
LABEL \
    org.label-schema.name="puddletag" \
    org.label-schema.description="Docker container for puddletag" \
    org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
    org.label-schema.vcs-url="https://github.com/jlesage/docker-puddletag" \
    org.label-schema.schema-version="1.0"
