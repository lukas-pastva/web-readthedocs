#!/bin/bash

if [ "${DATA}" != "" ]; then
    rm /docs/index.rst
    echo -e "${DATA}" | base64 -d > /docs/index.rst
fi
if [ "${NAME}" != "" ]; then
    sed -i -e "s|{NAME}|${NAME}|g" /docs/conf.py
fi

if [ ! -f ./conf.py ]; then
    echo "== Sphinx docs is not initialized =="
    echo " - Map a volume to /docs to work on existing documentaiton"
    echo " - Run sphinx-quickstart to create a new set of documentation"
    tail -F /dev/null
fi

sphinx-autobuild . _build_html -H 0.0.0.0 --poll