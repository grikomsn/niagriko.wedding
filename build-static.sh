#!/usr/bin/env bash

build_with_cache() {
  if [[ -d "$XDG_CACHE_HOME"/photos ]]; then
    echo "Copying cached photos directory..."
    rsync -a "$XDG_CACHE_HOME"/photos/ photos
  else
    echo "No cached photos directory to be found"
  fi

  echo "Building..."

  bundle exec jekyll build --incremental

  echo "Build complete, caching photos directory..."
  rsync -a photos/ "$XDG_CACHE_HOME"/photos
}

if [[ "$RENDER" ]]; then
  build_with_cache
else
  bundle exec jekyll build --incremental
fi
