FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs openjdk-8-jdk
WORKDIR /neo4j_rb
COPY Gemfile Gemfile.lock /neo4j_rb/
RUN bundle install
COPY . /neo4j_rb/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]