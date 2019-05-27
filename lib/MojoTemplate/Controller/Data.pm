package MojoTemplate::Controller::Data;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(encode_json decode_json);
use Data::Dumper;
use Try::Tiny;

use constant MODULE_NAME => qq(MojoTemplate::Controller::Data);

sub get {
    my $self = shift;

    $self->logger->debug(MODULE_NAME.": (get)");

    my $data = $self->data_service->get_record();

    if (defined($data)) {
        $self->render(json => { data => $data }, status => 200);
    } else {
        $self->render(json => { data => "Failed to get record." }, status => 500);
    }
}

sub post {
    my $self = shift;

    $self->logger->debug(MODULE_NAME.": (post)");

    put_post($self);
}

sub put {
    my $self = shift;

    $self->logger->debug(MODULE_NAME.": (put)");

    put_post($self);
}

sub delete {
    my $self = shift;

    $self->logger->debug(MODULE_NAME.": (delete)");

    my $id = $self->param('id');
    $self->render(json => { data => $id }, status => 200);
}

sub put_post {
    my $self = shift;

    try {
        my $json_data = decode_json($self->req->body);
        my $ret = $self->data_service->add_record($json_data->{data});
        if ($ret == 1) {
            $self->render(json => { data => $json_data->{data} }, status => 200);
        } else {
            $self->render(json => { data => "Failed to add record." }, status => 500);
        }
    }
    catch {
        $self->render(json => { data => $_ }, status => 500);
    };
}

1;
