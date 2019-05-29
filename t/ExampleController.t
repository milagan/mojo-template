use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('MojoTemplate');

sub test_default {
    $t->get_ok('/')
        ->status_is(200)
        ->content_like(qr/Mojolicious/i);
}

sub test_welcome {
    $t->get_ok('/welcome')
        ->status_is(200)
        ->content_like(qr/Welcome to the Mojolicious real-time web framework!/i);
}

sub test_hello {
    $t->get_ok('/hello')
        ->status_is(200)
        ->content_like(qr/Hello to the Mojolicious real-time web framework!/i);
}

sub test_slow {
    $t->get_ok('/slow?delay=1')
        ->status_is(302);
}

sub test_sub_process {
    $t->get_ok('/sub_process?delay=1')
        ->status_is(302);
}

sub test_chat {
    $t->get_ok('/chat')
        ->status_is(200);
}

sub test_channel {
    $t->websocket_ok('/channel')
        ->status_is(101);
}

$t->app->logger->info("***** Running ExampleController.t *****");

test_default();
test_welcome();
test_hello();
test_slow();
test_sub_process();
test_chat();
test_channel();

done_testing();
