FROM ruby:2.3

# Install Node.js (required as execjs runtime)
# Install cron
RUN apt-get update && \
  apt-get install -y --no-install-recommends nodejs cron && \
  rm -rf /var/lib/apt/lists/*

ADD Gemfile /opt/www.aptible.com/
ADD Gemfile.lock /opt/www.aptible.com/
WORKDIR /opt/www.aptible.com
RUN bundle install

ADD . /opt/www.aptible.com

EXPOSE 4567

CMD ["script/aptible-cmd.sh"]
