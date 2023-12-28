#!/bin/bash

cp -r /app/* /docs/

echo -e "${DATA}" | base64 -d > /docs/index.rst
sed -i -e "s|{NAME}|${NAME}|g" /docs/conf.py

#tail -F /dev/null
sphinx-autobuild . _build_html -H 0.0.0.0 --poll