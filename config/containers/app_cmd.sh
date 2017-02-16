#!/usr/bin/env bash
 
# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
bundle exec rake db:create db:migrate
bundle exec rails s -e $RAILS_ENV;
