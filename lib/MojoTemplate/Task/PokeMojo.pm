package MojoTemplate::Task::PokeMojo;
use strict;
use warnings FATAL => 'all';

use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app) = @_;
    $app->minion->add_task(poke_mojo => sub {
        my $job = shift;
        $job->app->ua->get('mojolicious.org');
        $job->app->log->debug('We have poked mojolicious.org for a visitor');
    });
}

1;