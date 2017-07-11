#!/bin/bash

set -e

# Start cron (to pull in Contentful content)
touch /var/log/whenever.log
whenever -w -f schedule.rb
cron
tail -f /var/log/whenever.log &

# Pull Contentful data
bundle exec rake contentful:pull

# Start Middleman server
bundle exec middleman server --reload-paths data/
