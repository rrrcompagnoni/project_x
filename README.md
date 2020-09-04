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

### Development notes
- We have to wait for a little when we start the gen server that asks for the most offensive reviewers. The timer does not make me proud and the issue is because Crawly needs some time to do its things. Maybe a more advanced supervision tree could handle it. At this time, I am just a little cowboy with supervisors and I am working to cover it.
- You may ask yourself that my test suite looks a little bit short. I have followed some principles:
  - Test the correctness of the requirements.
  - Skip tests describing simple interfaces close to the core, comply on the spec function attribute.
  - Everything that is not expected; Let it crash.
- Advanced environment management would be a nice feature for a production release.
