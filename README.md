# mojo_template

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