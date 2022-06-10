
FROM ubuntu:22.04 as base

WORKDIR /root

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y tzdata

# Install terminal emulator and emacs for UI
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends terminator
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y emacs

# Include Java
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y default-jre unzip

# Add user
ARG user
RUN adduser --disabled-password $user
USER $user
WORKDIR /home/$user

# Unzip nand2tetris
COPY --chown=$user nand2tetris.zip .
RUN unzip nand2tetris.zip && rm nand2tetris.zip && chmod +x nand2tetris/tools/*.sh

# Copy emacs config to home
COPY --chown=$user .emacs .

COPY --chown=$user terminator_config.txt ./.config/terminator/config

COPY --chown=$user .bashrc .

CMD ["terminator", "-u"]
