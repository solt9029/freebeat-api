## FreeBeat
### Setup
```sh
cp .env.example .env
vi .env # edit environment variables

docker-compose up db
rails db:migrate
rails s # localhost:3000/graphiql
```

### Development
- Dump graphql schema
```sh
rake graphql:schema:dump
```

- Generate graphql mutation
```sh
rails g graphql:mutation xxx ( ex. CreateVideo )
```

- Generate graphql object
```sh
rails g graphql object xxx ( ex. Video )
```
