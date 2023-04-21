#!/bin/sh

# A script to perform incremental backups using rsync

set -o errexit
set -o nounset
set -o pipefail

readonly SOURCE_DIR="/source"
readonly BACKUP_DIR="/target"
readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly RELATIVE_BACKUP_PATH="./${DATETIME}"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="${BACKUP_DIR}/latest"

mkdir -p "${BACKUP_DIR}"

rsync -av --delete \
  "${SOURCE_DIR}/" \
  --link-dest "${LATEST_LINK}" \
  "${BACKUP_PATH}"

cd "${BACKUP_DIR}"
rm -rf "${LATEST_LINK}"

# Creating a relative symlink to ensure it still works on the host machine
ln -s "${RELATIVE_BACKUP_PATH}" "${LATEST_LINK}"
