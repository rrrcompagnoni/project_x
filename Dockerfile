FROM elixir:1.10.4-alpine

RUN apk update

RUN mkdir /project_x

COPY . /project_x

WORKDIR /project_x

RUN mix local.hex --force

RUN mix local.rebar --force

RUN mix deps.get

RUN mix compile
