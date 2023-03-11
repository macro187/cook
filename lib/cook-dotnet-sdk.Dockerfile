FROM mcr.microsoft.com/dotnet/sdk:7.0

ARG user
ARG uid
ARG gid

#
# Create user
#
RUN set -eux ; \
    addgroup --gid $gid $user ; \
    adduser --disabled-password --uid $uid --ingroup $user $user

#
# Create /workspaces
#
USER root
WORKDIR /root
RUN set -eux ; \
    mkdir -p /workspaces ; \
    chown $user:$user /workspaces ; \
    chmod 750 /workspaces


#
# Default to user in /workspaces
#
USER $user:$user
WORKDIR /workspaces
