#!/bin/sh

if [ "`git status -s`" ]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public/*

echo "Generating site"
hugo --minify

echo "Committing changes to git"
cd public && git add --all && git commit -m "Republishing site $(date)"

echo "Pushing changes to git"
git push --all

cd ..