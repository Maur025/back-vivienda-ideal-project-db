# Vivienda Ideal API

## Description

Project to create an API for the vivienda-ideal database.

Project compose of 2 repositories:

- [Frontend](https://github.com/Maur025/front-vivienda-ideal-project-db).
- [Backend](https://github.com/Maur025/back-vivienda-ideal-project-db).

## Project setup

Project require pnpm package manager. If not installed, please install it first.
Cant install pnpm, please follow the instructions on their official website: https://pnpm.io/es/installation

To install all dependencies, run:

```bash
$ pnpm install
```

before run please review:

- [env.example](.env.example)
- [seeder data](seeder/vivienda-seeder.sql)

## Compile and run the project

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run start:dev

# production mode
$ pnpm run start:prod
```

Open [http://localhost:6976](http://localhost:6976) with your browser to see the swagger documentation.

## Run tests

```bash
# unit tests
$ pnpm run test

# e2e tests
$ pnpm run test:e2e

# test coverage
$ pnpm run test:cov
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## License

Nest is [MIT licensed](https://github.com/nestjs/nest/blob/master/LICENSE).
