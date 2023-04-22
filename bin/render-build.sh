# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails RAILS_ENV=production db:schema:load DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec rails db:seed
