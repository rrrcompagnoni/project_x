# ProjectX

Project X will discover the three worst offenders through the average of reviews made. In the case of ties, the most recent reviews take advantage of the precedence.

## Application setup

### Requirements
- Docker: https://docs.docker.com/engine/install
- Docker Compose - https://docs.docker.com/compose/install/

### Building the application
`docker-compose build`

### Testing the application
`docker-compose run project_x mix test`

### Linting the application
`docker-compose run project_x mix linter`

### Formatting the code
`docker-compose run project_x mix format`

### Running the container console
`docker-compose run project_x /bin/sh`

## Output the worst offenders

After building the application, run:

`docker-compose run project_x mix uncover_worst_offenders`
