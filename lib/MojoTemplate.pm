package MojoTemplate;
use Mojo::Base 'Mojolicious';

use MojoTemplate::Repository::SQLiteRepository;
use MojoTemplate::Service::DataService;

use constant TEST_DATABASE => qq(dbi:SQLite:dbname=./databases/data.db);
use constant MODULE_NAME => qq(MojoTemplate);

# This method will run once at server start
sub startup {
  my $self = shift;
  $self->{_log} = Mojo::Log->new();

  # Plugins
  setup_plugins($self);
  # Helpers
  setup_helpers($self);
  # Services
  setup_services($self);
  # Router
  setup_routes($self);
}

sub setup_plugins {
  my ($self) = @_;

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # OpenAPI support
  $self->plugin(OpenAPI => {spec => $self->static->file("api.yaml")->path});
}

sub setup_helpers {
  my ($self) = @_;

  $self->helper(log => sub { return $self->{_log}; });
  $self->helper(data_service => sub { return $self->{_data_service}; });
}

sub setup_routes {
  my ($self) = @_;

  $self->log->debug(MODULE_NAME.": (setup_routes)");

  my $r = $self->routes;
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

sub setup_services {
  my ($self) = @_;

  $self->{_sqlite_repo} = MojoTemplate::Repository::SQLiteRepository->new($self->log, TEST_DATABASE);
  $self->{_data_service} = MojoTemplate::Service::DataService->new($self->log, $self->{_sqlite_repo});
}

1;
