[![Board Status](https://ilaganm.visualstudio.com/7d906663-7767-48ea-9119-acae02e8fae9/284ae090-cf32-4a3c-93ff-dbd45f97e62e/_apis/work/boardbadge/7437db08-c26d-4111-bc6d-dbfdf03ed8e2)](https://ilaganm.visualstudio.com/7d906663-7767-48ea-9119-acae02e8fae9/_boards/board/t/284ae090-cf32-4a3c-93ff-dbd45f97e62e/Microsoft.RequirementCategory)
# mojo_template

[![Build Status](https://travis-ci.com/milagan/mojo_template.svg?branch=master)](https://travis-ci.com/milagan/mojo_template)
[![codecov](https://codecov.io/gh/milagan/mojo_template/branch/master/graph/badge.svg)](https://codecov.io/gh/milagan/mojo_template)
[![Coverage Status](https://coveralls.io/repos/github/milagan/mojo_template/badge.svg?branch=master)](https://coveralls.io/github/milagan/mojo_template?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/milagan/mojo_template/badge)](https://www.codefactor.io/repository/github/milagan/mojo_template)
[![BCH compliance](https://bettercodehub.com/edge/badge/milagan/mojo_template?branch=master)](https://bettercodehub.com/)
[![Build Status](https://ilaganm.visualstudio.com/mojo_template/_apis/build/status/milagan.mojo_template?branchName=master)](https://ilaganm.visualstudio.com/mojo_template/_build/latest?definitionId=3&branchName=master)
[![Docker Layers](https://images.microbadger.com/badges/image/milagan77/mojo_template.svg)](https://microbadger.com/images/milagan77/mojo_template)
[![Docker Version](https://images.microbadger.com/badges/version/milagan77/mojo_template.svg)](https://microbadger.com/images/milagan77/mojo_template)
[![This project is using Percy.io for visual regression testing.](https://percy.io/static/images/percy-badge.svg)](https://percy.io/milagan/mojo_template)
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

## Virtualenv
```
$ ./virtualenv.pl venv
$ source venv/bin/activate
(venv) $ cpanm -L venv/ --installdeps --notest .
(venv) $ deactivate
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

## Running Percy Snapshots
```
$ export PERCY_TOKEN=???
$ npm run snapshots
```

## Testing Hound

## GPG on WSL
```
export GPG_TTY=$(tty)
```