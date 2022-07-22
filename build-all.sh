#!/usr/bin/env bash
#!/usr/bin/env bash
set -x
podman pull registry.fedoraproject.org/fedora-toolbox:36
bash build.sh base
bash build.sh python
