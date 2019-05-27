#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use Test::Mojo;

use FindBin;
use lib "$FindBin::Bin/../lib";

use MojoTemplate::Repository::SQLiteRepository;

my $t = Test::Mojo->new('MojoTemplate');
my $repo = undef;

use constant TEST_DATABASE => qq(./databases/data.db);

sub test_create_repository {
    $repo = MojoTemplate::Repository::SQLiteRepository->new($t->app, TEST_DATABASE);
    isnt($repo, undef, 'SQLiteRepository successfully created.');
}

sub test_create_repository_failure {
    my $temp_repo = MojoTemplate::Repository::SQLiteRepository->new($t->app, qq());
    is($temp_repo, undef, 'SQLiteRepository creation should fail.');
}

sub test_add_record {
    my $ret = $repo->add_record('sample');
    is($ret, 1, 'add_record should succeed.');
}

sub test_add_record_failure {
    my $ret = $repo->add_record('sample');
    is($ret, 0, 'add_record should fail.');
}

sub test_get_record {
    my $ret = $repo->get_record();
    isnt($ret, undef, 'get_record should succeed.');
}

sub test_get_record_failure {
    my $ret = $repo->get_record();
    is($ret, undef, 'get_record should fail.');
}

sub test_delete_record {
    my $ret = $repo->delete_record('sample');
    is($ret, 1, 'delete_record should succeed.');
}

sub test_delete_failure {
    my $ret = $repo->delete_record('sample');
    is($ret, 0, 'delete_record should fail.');
}


$t->app->logger->info("***** Running SQLiteRepository.t *****");

test_create_repository();
test_create_repository_failure();
test_add_record();
test_get_record();
test_delete_record();

$repo->{_db} = undef;

test_add_record_failure();
test_get_record_failure();
test_delete_failure();

done_testing();

