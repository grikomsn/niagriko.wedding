#!/usr/bin/env bash

npx degit waschinski/photo-stream --force
git clean -f photos/** LICENSE
git restore photos/** .env .gitattributes README.md social-preview.png
sed -i "" "s/<\/head>/\t<script src=\"https:\/\/cdn.usefathom.com\/script.js\" data-site=\"VUXUQYOG\" defer><\/script>\n<\/head>/" _includes/head.html
