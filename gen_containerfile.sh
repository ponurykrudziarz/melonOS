#!/usr/bin/env bash

./generate_from_template.sh && cd generated && bluebuild generate -o ../CONTAINERFILE recipes/recipe.yml
