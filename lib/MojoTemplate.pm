package MojoTemplate;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;
  my $log = Mojo::Log->new();

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # OpenAPI support
  $self->plugin(OpenAPI => {spec => $self->static->file("api.yaml")->path});

  # Helpers
  $self->helper(log => sub { return $log; });

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/welcome')->to('example#welcome');
  $r->get('/hello')->to('example#hello');

  $r->get('/api/data')->to('data#get');
  $r->post('/api/data')->to('data#post');
  $r->put('/api/data')->to('data#put');
  $r->delete('/api/data/:id')->to('data#delete');
}

1;
