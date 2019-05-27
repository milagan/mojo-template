package MojoTemplate::Repository::SQLiteRepository;
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use DBI;
use Try::Tiny;

use constant MODULE_NAME => qq(MojoTemplate::Repository::SQLiteRepository);

sub new {
    my ($class) = shift;
    my $self = {
        _app    => shift,
        _db_uri => shift
    };

    if (!init($self)) {
        return undef;
    }

    bless $self, $class;
    return $self;
}

sub init {
    my ($self) = @_;
    my $ret = 0;

    $self->{_app}->logger->debug(MODULE_NAME.": (init)");

    if (!-e $self->{_db_uri}) {
        $self->{_app}->logger->error(MODULE_NAME.": (init) database file is missing");
    } else {
        my $db = "dbi:SQLite:dbname=".$self->{_db_uri};
        $self->{_db} = DBI->connect($db, "", "",
            { RaiseError => 1, AutoCommit => 1, sqlite_unicode => 1 });
    }

    if (defined($self->{_db})) {
        $ret = 1;
    }

    return $ret;
}

sub add_record {
    my ($self, $name) = @_;
    my $ret = 0;

    $self->{_app}->logger->debug(MODULE_NAME . ": (add_record) $name");

    try {
        my $sql = qq(insert into test (name) values (?););
        my $command = $self->{_db}->prepare($sql);
        $command->execute($name);
        $ret = 1;
    } catch {
        $self->{_app}->logger->error(MODULE_NAME . ": (add_record) $_");
    };

    return $ret;
}

sub get_record {
    my ($self) = @_;
    my $data = undef;

    $self->{_app}->logger->debug(MODULE_NAME . ": (get_record)");
    
    try {
        my $sql = qq(select * from test;);
        my $command = $self->{_db}->prepare($sql);
        $command->execute();
        $data = $command->fetchall_arrayref({});
    } catch {
        $self->{_app}->logger->error(MODULE_NAME . ": (add_record) $_");
    };

    return $data;
}

1;