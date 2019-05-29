use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'MojoTemplate',
    VERSION            => '0.01',
    test               => { TESTS => 't/*.t' },
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 6.64,
    },
    BUILD_REQUIRES     => {
    },
    PREREQ_PM          => {
        'Class::Method::Modifiers'     => '2.12',
        'CryptX'                       => '0.063',
        'Math::BigInt::LTM'            => '0.063',
        'Mojolicious'                  => '8.15',
        'Role::Tiny'                   => '2.000006',
        'Try::Tiny'                    => '0.30',
        'Mojolicious::Plugin::OpenAPI' => '2.14',
        'DBI'                          => '1.642',
        'DBD::SQLite'                  => '1.62',
        'Mojolicious::Plugin::Status'  => '1.0'
    },
    TEST_REQUIRES      => {
        'Test::More'                      => 0,
        'Test::Mojo'                      => 0,
        'Module::ScanDeps'                => 0,
        'Devel::Cover'                    => '1.33',
        'Devel::Cover::Report::Codecov'   => '0.25',
        'Devel::Cover::Report::Coveralls' => '0.11',
        'YAML::XS'                        => '0.78'
    },
);
