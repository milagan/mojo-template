# mojo_template

[![Build Status](https://travis-ci.com/milagan/mojo_template.svg?branch=master)](https://travis-ci.com/milagan/mojo_template)
[![codecov](https://codecov.io/gh/milagan/mojo_template/branch/master/graph/badge.svg)](https://codecov.io/gh/milagan/mojo_template)
[![Coverage Status](https://coveralls.io/repos/github/milagan/mojo_template/badge.svg?branch=master)](https://coveralls.io/github/milagan/mojo_template?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/milagan/mojo_template/badge)](https://www.codefactor.io/repository/github/milagan/mojo_template)
[![BCH compliance](https://bettercodehub.com/edge/badge/milagan/mojo_template?branch=master)](https://bettercodehub.com/)
[![Build Status](https://ilaganm.visualstudio.com/mojo_template/_apis/build/status/milagan.mojo_template?branchName=master)](https://ilaganm.visualstudio.com/mojo_template/_build/latest?definitionId=3&branchName=master)
[![Docker Layers](https://images.microbadger.com/badges/image/milagan77/mojo_template.svg)](https://microbadger.com/images/milagan77/mojo_template)
[![Docker Version](https://images.microbadger.com/badges/version/milagan77/mojo_template.svg)](https://microbadger.com/images/milagan77/mojo_template)
## Create Project
```
$ mojo generate app
```

## Build, Test, and Distribute
```
$ perl Makefile.PL
$ make
$ make test
$ make manifest
$ make dist
```

## Test and Code Coverage
```
$ prove -v
$ cover -test
```

## Install Dependencies
```
$ cpanm --installdeps .
```

## Scan for Dependencies
```
$ scandeps.pl script/mojo_template
```

## Travis + GitHub Releases
https://docs.travis-ci.com/user/deployment/releases/

## Building Docker Image
```
$ docker build -t milagan77/mojo_template .
```

## Running via Docker
```
$ docker run -p 8080:8080 milagan77/mojo_template
```
