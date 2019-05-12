package MojoTemplate;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;
  my $log = new Mojo::Log();

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # Helpers
  $self->helper(log => sub { return $log; });

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/welcome')->to('example#welcome');
  $r->get('/hello')->to('example#hello');

  $r->get('/api/data')->to('api#get_data');
  $r->post('/api/data')->to('api#post_data');
  $r->put('/api/data')->to('api#put_data');
  $r->delete('/api/data/:id')->to('api#delete_data');
}

1;
