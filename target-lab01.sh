#!/bin/bash

export OM_USERNAME=opsman
export OM_TARGET=pcf.lab01.telmore.io

unset OM_PASSWORD

read -e -p "Enter OPSMAN Password: " PWD
export OM_PASSWORD=$PWD

eval "$(om -k bosh-env -i ~/.ssh/lab01-gcp-opsman)"
