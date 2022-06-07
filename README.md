## Monolith build with Ruby On Rails

This repo contains the monolith of bycoders application.

To start this project, run
- `docker-compose build` to build the containers
- `docker-compose up` to start the project

### Unit Tests

To run model tests
`bundle exec rspec spec/models/transaction_spec.rb`

To run requests tests
`bundle exec rspec spec/requests/transactions_spec.rb`
