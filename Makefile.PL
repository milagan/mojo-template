use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME      => 'MojoTemplate',
  VERSION   => '0.01',
  test      => {TESTS => 't/*.t'},
  CONFIGURE_REQUIRES => {
    'ExtUtils::MakeMaker' => 6.64,
  },
  BUILD_REQUIRES => {
  },
  PREREQ_PM => {
    'Class::Method::Modifiers'           => '2.12',
    'CryptX'                             => '0.063',
    'Math::BigInt::LTM'                  => '0.063',
    'Mojolicious'                        => '8.15',
    'Role::Tiny'                         => '2.000006',
    'Try::Tiny'                          => '0.30',
    'Mojolicious::Plugin::OpenAPI'       => '2.14'
  },
  TEST_REQUIRES => {
    'Test::More' => 0,
    'Test::Mojo' => 0,
    'Module::ScanDeps' => 0
  },
);
