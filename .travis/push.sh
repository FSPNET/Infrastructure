#!/bin/bash
set -o errexit

PUSH=1


if [[ "$TRAVIS_BRANCH" == "master" ]]; then
  if [[ -z "$DOCKER_USERNAME" || -z "$DOCKER_PASSWORD" ]]; then
    echo "Skipping Docker push, no credentials specified."
    PUSH=0
  else
    echo "$DOCKER_PASSWORD" | sudo docker login -u "$DOCKER_USERNAME" --password-stdin
  fi

    if [[ "$PUSH" -eq 1 ]]; then
      echo "Pushing $repo:$base$type$version"
      sudo docker push $repo:$base$type$version
    else
      echo "Would have pushed as $repo:$base$type$version"
    fi

    if [[ "$latest" == "$version" ]]; then
      if [[ "$PUSH" -eq 1 ]]; then
        echo "Pushing this one as latest!"
        sudo docker tag $repo:$base$type$version $repo:latest
        sudo docker push $repo:latest
      else
        echo "Would have pushed as $repo:latest"
      fi
    fi

  fi
fi