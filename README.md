# Setup Nestjs boilerplate
1. Get `Nestjs template` from stage builder
2. Copy `Nestjs template` from stage builder to current host machine directory where this readme file is written
3. Build Dockerfile with dev as target stage
4. When development is completed, then build prod as target stage


### Get Nestjs template from stage builder
```
$ docker-compose up nestjs-boilerplate-builder
```


### Copy Nestjs template from stage builder to current host machine directory where this readme file is written
```
$ docker cp Nestjs-boilerplate-builder:/opt/nestjs_boilerplate/nestjs/. .
```


### Build Dockerfile with dev as target stage
```
$ docker-compose up nestjs-boilerplate-dev
```

After this we can do our local development. Once development is done we can create production image.

### When development is completed, then build prod as target stage
```
$ docker-compose up nestjs-boilerplate-prod
```