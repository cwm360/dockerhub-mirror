#!/bin/sh

for file in $(ls tags)
    do
        for tag in $(cat tags/$file)
            do
                export dockerhub_tag=docker.io/library/$file:$tag
                export ghcr_tag=ghcr.io/code-with-mehdi/$file:$tag
                podman pull $dockerhub_tag
                podman tag $dockerhub_tag $ghcr_tag
                podman push $ghcr_tag
        done
done