package MojoTemplate::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::IOLoop;
use Sentry::Raven;

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

# This action will render a template
sub chat {
  my $self = shift;

  # Render template "example/chat.html.ep"
  $self->render();
}

sub slow {
  my $self = shift;

  $self->inactivity_timeout(3600);

  my $delay = $self->param('delay') || 20;
  Mojo::IOLoop->timer($delay => sub { $self->redirect_to('/index.html') });
}

sub sub_process {
  my $self = shift;

  $self->inactivity_timeout(3600);

  my $delay = $self->param('delay') || 5;

  Mojo::IOLoop->subprocess(sub { sleep $delay },
      sub { $self->redirect_to('/index.html') });
}

sub channel {
  my $self = shift;

  $self->inactivity_timeout(3600);

  # Forward messages from the browser
  $self->on(message => sub { shift->events->emit(mojochat => shift) });

  # Forward messages to the browser
  my $cb = $self->events->on(mojochat => sub { $self->send(pop) });
  $self->on(finish => sub { shift->events->unsubscribe(mojochat => $cb) });
}

sub sentry_error {
  my $self = shift;

  $self->raven->capture_errors(sub {
    my $value = 1 / 0;
  });

  $self->render(json => { data => "OK" }, status => 200);
}

sub sentry_message {
  my $self = shift;
  
  $self->raven->capture_message('The sky is falling');
  $self->render(json => { data => "OK" }, status => 200);
}

1;
