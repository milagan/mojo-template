#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use Mojo::Log;

use FindBin;
use lib "$FindBin::Bin/../lib";

use MojoTemplate::Repository::SQLiteRepository;

my $repo = undef;
my $log = Mojo::Log->new();

use constant TEST_DATABASE => qq(dbi:SQLite:dbname=./databases/data.db);

sub test_create_database {
    `sqlite3 databases/data.db < databases/data.sql`;
}

sub test_create_repository {
    $repo = MojoTemplate::Repository::SQLiteRepository->new($log, TEST_DATABASE);
    isnt($repo, undef, 'SQLiteRepository successfully created.');
}

sub test_add_record {
    my $ret = $repo->add_record('sample');
    is($ret, 1, 'add_record should succeed.');
}

sub test_add_record_failure {
    my $ret = $repo->add_record('sample');
    is($ret, 0, 'add_record should fail.');
}

test_create_database();
test_create_repository();
test_add_record();

$repo->{_db} = undef;

test_add_record_failure();

done_testing();

