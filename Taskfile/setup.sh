#!/usr/bin/env bash

# download Taskfile.yml und Taskfile-build.yml und ins aktuelle Verzeichnis ablegen
set -e
curl -o Taskfile.yml https://raw.githubusercontent.com/Taskfile/taskfile/main/Taskfile.yml
curl -o Taskfile-build.yml https://raw.githubusercontent.com/Taskfile/taskfile/main/Taskfile-build.yml
# installiere Taskfile durch anlegen eines symlinks im Userverzeichnis
ln -s "$(pwd)/Taskfile.yml" $HOME/Taskfile.yml
ln -s "$(pwd)/Taskfile-build.yml" $HOME/Taskfile-build.yml
