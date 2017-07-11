# schedule.rb
set :output, '/var/log/whenever.log'

# Inherit all ENV variables
ENV.each { |k, v| env(k, v) }

every 1.minutes do
  command 'cd /opt/www.aptible.com && bundle exec rake contentful:pull'
end
