package MojoTemplate::Service::DataService;
use strict;
use warnings FATAL => 'all';

use Try::Tiny;

use constant MODULE_NAME => qq(MojoTemplate::Service::DataService);

sub new {
    my ($class) = shift;
    my $self = {
        _app => shift
    };

    init($self);


    bless $self, $class;
    return $self;
}

sub init {
    my ($self) = @_;
    my $ret = 0;

    $self->{_app}->logger->debug(MODULE_NAME . ": (init)");

    $ret = 1;

    return $ret;
}

sub add_record {
    my ($self, $name) = @_;
    my $ret = 0;

    $self->{_app}->logger->debug(MODULE_NAME . ": (add_record) $name");

    try {
        $ret = $self->{_app}->data_repo->add_record($name);
    } catch {
        $self->{_app}->logger->error(MODULE_NAME . ": (add_record) $_");
    };

    return $ret;
}

sub get_record {
    my ($self,) = @_;
    my $data = undef;

    $self->{_app}->logger->debug(MODULE_NAME . ": (get_record)");

    try {
        $data = $self->{_app}->data_repo->get_record();
    } catch {
        $self->{_app}->logger->error(MODULE_NAME . ": (get_record) $_");
    };

    return $data;
}

1;