#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use Test::Mojo;

use Mojo::Log;

use FindBin;
use lib "$FindBin::Bin/../lib";

use MojoTemplate::Service::DataService;

my $t = Test::Mojo->new('MojoTemplate');
my $service = undef;

use constant TEST_DATABASE => qq(dbi:SQLite:dbname=./databases/data.db);

sub test_create_service {
    $service = MojoTemplate::Service::DataService->new($t->app);
    isnt($service, undef, 'DataService successfully created.');
}

sub test_add_record {
    my $ret = $service->add_record('sample');
    is($ret, 1, 'add_record should succeed.');
}

sub test_add_record_failure {
    my $ret = $service->add_record('sample');
    is($ret, 0, 'add_record should fail.');
}

$t->app->logger->info("***** Running DataService.t *****");

test_create_service();
test_add_record();

$t->app->helper(data_repo => sub {
    return undef;
});

test_add_record_failure();

done_testing();

