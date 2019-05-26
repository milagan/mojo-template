use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('MojoTemplate');
$t->get_ok('/api/data')
    ->status_is(200)
    ->content_like(qr/"data":"sample"/i);

$t->post_ok('/api/data')
    ->status_is(500)
    ->content_like(qr/"data":/i);

$t->post_ok('/api/data'
    => {Accept => 'application/json'}
    => json => {data => 'test'})
    ->status_is(200)
    ->content_like(qr/"data":"test"/i);

$t->put_ok('/api/data')
    ->status_is(500)
    ->content_like(qr/"data":/i);

$t->put_ok('/api/data'
    => {Accept => 'application/json'}
    => json => {data => 'test'})
    ->status_is(200)
    ->content_like(qr/"data":"test"/i);

$t->delete_ok('/api/data/1')
    ->status_is(200)
    ->content_like(qr/"data":"1"/i);

done_testing();
