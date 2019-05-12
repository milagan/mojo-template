package MojoTemplate::Controller::Api;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(encode_json decode_json);
use Data::Dumper;
use Try::Tiny;

sub index {
    my $self = shift->openapi->valid_input or return;

    # Render back the same data as you received using the "openapi" handler
    $self->render(openapi => $self->req->json);
}

1;