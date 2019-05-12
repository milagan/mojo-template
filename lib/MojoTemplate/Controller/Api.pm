package MojoTemplate::Controller::Api;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub data {
  my $self = shift;

  $self->render(json => { data => 'sample'}, status => 200);
}

1;
