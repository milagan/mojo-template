package MojoTemplate::Repository::SQLiteRepository;
use strict;
use warnings FATAL => 'all';

use DBI;
use Try::Tiny;

use constant MODULE_NAME => qq(MojoTemplate::Repository::SQLiteRepository);

sub new {
    my ($class) = shift;
    my $self = {
        _logger     => shift,
        _db_uri     => shift
    };

    init($self);

    bless $self, $class;
    return $self;
}

sub init {
    my ($self) = @_;
    my $ret = 0;

    try {
        $self->{_db} = DBI->connect($self->{_db_uri}, "", "",
            { RaiseError => 1, AutoCommit => 1, sqlite_unicode => 1 });
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
        my $sql = qq(insert into test (name) values (?););
        my $command = $self->{_db}->prepare($sql);
        $command->execute($name);
        $ret = 1;
    } catch {
        $self->{_logger}->error(MODULE_NAME.": (add_record) $_");
    };

    return $ret;
}

1;