FROM ruby:2.6.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list
RUN  apt-get update &&  apt-get install yarn -y
RUN mkdir /MultiCrew
WORKDIR /MultiCrew
COPY Gemfile /MultiCrew/Gemfile
COPY Gemfile.lock /MultiCrew/Gemfile.lock
RUN bundle install
COPY . /MultiCrew

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN yarn install --check-files
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]