use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('MojoTemplate');

sub test_data_get {
    $t->get_ok('/api'
        => { Accept => 'application/json' })
        ->status_is(200);

    $t->get_ok('/api/data')
        ->status_is(200)
        ->content_like(qr/"data":/i);
}

sub test_data_post {
    $t->post_ok('/api/data')
        ->status_is(500)
        ->content_like(qr/"data":/i);

    $t->post_ok('/api/data'
        => { Accept => 'application/json' }
        => json => { data => 'test' })
        ->status_is(200)
        ->content_like(qr/"data":"test"/i);
}

sub test_data_post_failure {
    $t->post_ok('/api/data'
        => { Accept => 'application/json' }
        => json => { data => 'test' })
        ->status_is(500)
        ->content_like(qr/"data":/i);
}

sub test_data_put {
    $t->put_ok('/api/data')
        ->status_is(500)
        ->content_like(qr/"data":/i);

    $t->put_ok('/api/data'
        => { Accept => 'application/json' }
        => json => { data => 'test' })
        ->status_is(200)
        ->content_like(qr/"data":"test"/i);
}

sub test_data_delete {
    $t->delete_ok('/api/data/1')
        ->status_is(200)
        ->content_like(qr/"data":"1"/i);
}

$t->app->logger->info("***** Running DataController.t *****");

test_data_get();
test_data_post();
test_data_put();
test_data_delete();

$t->app->helper(data_repo => sub {
    return undef;
});

test_data_post_failure();

done_testing();
