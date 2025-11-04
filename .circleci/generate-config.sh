#!/bin/bash -e

cat ./.circleci/template-config.yml > ./.circleci/generated-config.yml

while IFS="" read -r board; do
  cat << EOF
      - build:
          name: $board
          target: $board
          subcommand: ""
          requires:
            - prep_env

EOF
done <<<$(ls -w1 ./boards/) >> ./.circleci/generated-config.yml


