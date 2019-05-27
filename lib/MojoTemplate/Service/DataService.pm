package MojoTemplate::Service::DataService;
use strict;
use warnings FATAL => 'all';

use Try::Tiny;

use constant MODULE_NAME => qq(MojoTemplate::Service::DataService);

sub new {
    my ($class) = shift;
    my $self = {
        _logger     => shift,
        _repo       => shift
    };

    init($self);

    bless $self, $class;
    return $self;
}

sub init {
    my ($self) = @_;
    my $ret = 0;

    $self->{_logger}->debug(MODULE_NAME.": (init)");

    try {
        $ret = 1;
    } catch {
    };

    return $ret;
}

sub add_record {
    my ($self, $name) = @_;
    my $ret = 0;

    $self->{_logger}->debug(MODULE_NAME.": (add_record) $name");

    try {
        $ret = $self->{_repo}->add_record($name);
    } catch {
        $self->{_logger}->error(MODULE_NAME.": (add_record) $_");
    };

    return $ret;
}

1;