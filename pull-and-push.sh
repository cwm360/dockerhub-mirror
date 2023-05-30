#!/bin/sh

# TODO: Create a Python crawler to crawl Docker Hub tags periodically and pull new tags and push them to GHCR
for file in $(ls tags)
    do
        for tag in $(cat tags/$file)
            do
                export dockerhub_tag=docker.io/library/$file:$tag
                export ghcr_tag=ghcr.io/code-with-mehdi/$file:$tag
                podman pull $dockerhub_tag
                podman tag $dockerhub_tag $ghcr_tag
                podman push $ghcr_tag
                podman image rm $dockerhub_tag
        done
done