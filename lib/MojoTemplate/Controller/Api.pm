package MojoTemplate::Controller::Api;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(encode_json decode_json);
use Data::Dumper;
use Try::Tiny;

sub get_data {
  my $self = shift;

  $self->render(json => { data => 'sample'}, status => 200);
}

sub post_data {
  my $self = shift;

  try {
    my $json_data = decode_json($self->req->body);
    $self->render(json => { data => $json_data->{data}}, status => 200);
  } catch {
    $self->render(json => { data => $_}, status => 500);
  };
}

sub put_data {
  my $self = shift;

  try {
    my $json_data = decode_json($self->req->body);
    $self->render(json => { data => $json_data->{data}}, status => 200);
  } catch {
    $self->render(json => { data => $_}, status => 500);
  };
}

sub delete_data {
  my $self = shift;

  my $id = $self->param('id');
  $self->render(json => { data => $id}, status => 200);
}

1;
