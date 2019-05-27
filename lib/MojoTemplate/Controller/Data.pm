package MojoTemplate::Controller::Data;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(encode_json decode_json);
use Data::Dumper;
use Try::Tiny;

sub get {
  my $self = shift;

  $self->render(json => { data => 'sample'}, status => 200);
}

sub post {
  my $self = shift;

  put_post($self);
}

sub put {
  my $self = shift;

  put_post($self);
}

sub delete {
  my $self = shift;

  my $id = $self->param('id');
  $self->render(json => { data => $id}, status => 200);
}

sub put_post {
  my $self = shift;

  try {
    my $json_data = decode_json($self->req->body);
    $self->render(json => { data => $json_data->{data}}, status => 200);
  } catch {
    $self->render(json => { data => $_}, status => 500);
  };
}

1;
