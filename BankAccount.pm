package BankAccount;

sub new {
    my ($class, $account_number, $balance) = @_;
    my $self = {
        account_number => $account_number,
        balance        => $balance || 0,
        is_open        => 1,
        is_blocked     => 0,
    };
    bless $self, $class;
    return $self;
}

sub deposit {
    my ($self, $amount) = @_;
    if ($self->{is_open} && !$self->{is_blocked} && $amount > 0) {
        $self->{balance} += $amount;
        return 1;
    } else {
        return 0;
    }
}

sub withdraw {
    my ($self, $amount) = @_;
    if ($self->{is_open} && !$self->{is_blocked} && $amount > 0 && $self->{balance} >= $amount) {
        $self->{balance} -= $amount;
        return 1;
    } else {
        return 0;
    }
}

sub get_balance {
    my ($self) = @_;
    return $self->{balance};
}

1; # Verdadeiro para indicar que o módulo foi carregado com sucesso
