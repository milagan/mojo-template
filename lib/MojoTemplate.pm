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
  setup_routes($self->routes);
}

sub setup_routes {
  my $r = shift;

  setup_example_route($r);
  setup_data_route($r);
}

sub setup_example_route {
  my $r = shift;

  $r->get('/')->to('example#welcome');
  $r->get('/welcome')->to('example#welcome');
  $r->get('/hello')->to('example#hello');
}

sub setup_data_route {
  my $r = shift;

  $r->get('/api/data')->to('data#get');
  $r->post('/api/data')->to('data#post');
  $r->put('/api/data')->to('data#put');
  $r->delete('/api/data/:id')->to('data#delete');
}

1;
