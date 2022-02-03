#!/bin/bash

MAGMA_ROOT=/Users/shubham/myfiles/magma-production/mini-magma
MAGMA_GALAXY_ROOT=/Users/shubham/myfiles/git/magma-galaxy

MINI_MAGMA_ROOT=${MAGMA_ROOT}/orc8r/cloud/deploy/mini-magma
MAGMA_GALAXY_ROLES_ROOT=${MAGMA_GALAXY_ROOT}/roles

# Sync roles
rsync -a --delete ${MAGMA_GALAXY_ROLES_ROOT} ${MINI_MAGMA_ROOT}

find ${MINI_MAGMA_ROOT}/roles -type f -name 'README.md' -delete
find ${MINI_MAGMA_ROOT}/roles -type d -name 'meta' -exec rm -rf {} +

# Sync docs
rsync -a --delete ${MAGMA_GALAXY_ROOT}/docs ${MINI_MAGMA_ROOT}

rm ${MINI_MAGMA_ROOT}/docs/collection-setup.md ${MINI_MAGMA_ROOT}/docs/debug.md

# Sync ansible.cfg
rsync -a --delete ${MAGMA_GALAXY_ROOT}/ansible.cfg ${MINI_MAGMA_ROOT}
