#!/bin/bash -e

cat ~/heads/.circleci/template-config.yml > ~/heads/.circleci/generated-config.yml

while IFS="" read -r board; do
  cat << EOF
      - build:
          name: $board
          target: $board
          subcommand: ""
          requires:
            - prep_env

EOF
done <<<$(ls -w1 ~/heads/boards/) >> ~/heads/.circleci/generated-config.yml


