# Clarion

A CfP automation system for OpenFest.

## Installation

### For local development

1. `git clone https://git.openfest.org/Site/clarion/`
2. Run `rvm install "ruby-$(cat .ruby-version)"; rvm install "ruby-$(cat .ruby-version)"`
3. Start up postgresql
4. Run `bundle install; bin/rake bootstrap`
5. You can now run the rails server with `bin/rails s`

### For production

`docker build -t clarion:latest -f Dockerfile .`

Note that the docker image contains a default user (for credentials see `db/seeds.rb`).

### docker-compose

`docker-compose up` will bring everything up on `http://127.0.0.1:3000` with production configuration.

## Initial Usage

1. Go to `http://127.0.0.1:3000/management/`
2. Login (for initial creds see `db/seeds.rb`)
3. Change the credentials
4. Create a conference.
  - NB: When creating a conference make sure to use the same `domain` as the one you are currently using, otherwise nothing will be shown.
