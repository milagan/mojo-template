use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('MojoTemplate');

$t->get_ok('/')
    ->status_is(200)
    ->content_like(qr/Mojolicious/i);

$t->get_ok('/welcome')
    ->status_is(200)
    ->content_like(qr/Welcome to the Mojolicious real-time web framework!/i);

$t->get_ok('/hello')
    ->status_is(200)
    ->content_like(qr/Hello to the Mojolicious real-time web framework!/i);

done_testing();
