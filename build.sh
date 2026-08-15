#!/usr/bin/env bash

./generate_from_template.sh && cd generated && bluebuild build recipes/recipe.yml
