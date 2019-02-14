#!/bin/bash

set -e
set -eo pipefail

conda config --set always_yes true --set quiet true
conda update conda
conda config --set pip_interop_enabled True # Enable pip interoperability
conda config --add channels conda-forge
conda env create -f environment-dev.yml --name ${ENV_NAME}
conda env list
source activate ${ENV_NAME}
pip install pip --upgrade
pip install --no-deps -e .
conda list -n ${ENV_NAME}
