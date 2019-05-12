use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('MojoTemplate');
$t->get_ok('/api/data')->status_is(200)->content_like(qr/"data":"sample"/i);

done_testing();
