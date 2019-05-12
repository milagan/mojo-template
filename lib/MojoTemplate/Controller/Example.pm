package MojoTemplate::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

# This action will render a template
sub hello {
  my $self = shift;

  # Render template "example/hello.html.ep" with message
  $self->render(msg => 'Hello to the Mojolicious real-time web framework!');
}

1;
