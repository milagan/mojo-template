package MojoTemplate;
use Mojo::Base 'Mojolicious';
use Mojo::EventEmitter;
use Sentry::Raven;

use MojoTemplate::Repository::SQLiteRepository;
use MojoTemplate::Service::DataService;

use constant PATH_DATABASE_FILE => qq(./databases/data.db);
use constant PATH_DATABASE_SCRIPT => qq(./databases/data.sql);
use constant MODULE_NAME => qq(MojoTemplate);

sub startup {
  my $self = shift;
  $self->{_log} = Mojo::Log->new(path => './mojo_template.log', level => 'debug');

  # Helpers
  setup_helpers($self);
  # Databases
  setup_databases($self);
  # Plugins
  setup_plugins($self);
  # Services
  setup_services($self);
  # Router
  setup_routes($self);
}

sub setup_helpers {
  my ($self) = @_;

  $self->{_log}->info(MODULE_NAME.": (setup_helpers)");

  $self->helper(logger => sub {
    return $self->{_log};
  });

  $self->helper(data_service => sub {
    $self->logger->debug(MODULE_NAME.": helper (data_service)");
    return $self->{_data_service};
  });

  $self->helper(data_repo => sub {
    $self->logger->debug(MODULE_NAME.": helper (data_repo)");
    return $self->{_sqlite_repo};
  });

  $self->helper(events => sub {
    state $events = Mojo::EventEmitter->new
  });

  $self->helper(raven => sub {
    return $self->{_raven};
  });
}

sub setup_databases {
  my ($self) = @_;

  $self->logger->info(MODULE_NAME.": (setup_databases)");

  my $db_file = PATH_DATABASE_FILE;
  my $db_script = PATH_DATABASE_SCRIPT;
  if (!-e $db_file) {
    system(qq(sqlite3 $db_file < $db_script));
  }
}

sub setup_plugins {
  my ($self) = @_;

  $self->logger->info(MODULE_NAME.": (setup_plugins)");

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # OpenAPI support
  $self->plugin(OpenAPI => {spec => $self->static->file("api.yaml")->path});

  # Mojolicious Status support
  $self->plugin('Status');

  # Sentry Raven support
  my $sentry_dsn = $ENV{"SENTRY_DSN"} ? $ENV{"SENTRY_DSN"} : $config->{sentry_dsn};
  $self->{_raven} = Sentry::Raven->new(sentry_dsn => $sentry_dsn);
}

sub setup_routes {
  my ($self) = @_;

  $self->logger->info(MODULE_NAME.": (setup_routes)");

  my $r = $self->routes;
  setup_example_route($r);
  setup_data_route($r);
}

sub setup_example_route {
  my $r = shift;

  $r->get('/')->to('example#welcome');
  $r->get('/welcome')->to('example#welcome');
  $r->get('/hello')->to('example#hello');
  $r->get('/slow')->to('example#slow');
  $r->get('/sub_process')->to('example#sub_process');
  $r->websocket('channel')->to('example#channel');
  $r->get('/chat')->to('example#chat');
  $r->get('/sentry/error')->to('example#sentry_error');
  $r->get('/sentry/message')->to('example#sentry_message');

}

sub setup_data_route {
  my $r = shift;

  $r->get('/api/data')->to('data#get');
  $r->post('/api/data')->to('data#post');
  $r->put('/api/data')->to('data#put');
  $r->delete('/api/data/:name')->to('data#delete');
}

sub setup_services {
  my ($self) = @_;

  $self->logger->info(MODULE_NAME.": (setup_services)");

  $self->{_sqlite_repo} = MojoTemplate::Repository::SQLiteRepository->new($self, PATH_DATABASE_FILE);
  $self->{_data_service} = MojoTemplate::Service::DataService->new($self);
}

1;
