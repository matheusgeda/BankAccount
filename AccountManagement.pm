package AccountManagement;

sub open_account {
    my ($self) = @_;
    if (!$self->{is_open}) {
        $self->{is_open} = 1;
        return 1;
    } else {
        return 0; # A conta já está aberta
    }
}

sub close_account {
    my ($self) = @_;
    if ($self->{is_open} && !$self->{is_blocked}) {
        $self->{is_open} = 0;
        return 1;
    } else {
        return 0; # Não é possível fechar uma conta bloqueada ou já fechada
    }
}

sub block_account {
    my ($self) = @_;
    if ($self->{is_open} && !$self->{is_blocked}) {
        $self->{is_blocked} = 1;
        return 1;
    } else {
        return 0; # Não é possível bloquear uma conta que já está bloqueada ou fechada
    }
}

sub unblock_account {
    my ($self) = @_;
    if ($self->{is_open} && $self->{is_blocked}) {
        $self->{is_blocked} = 0;
        return 1;
    } else {
        return 0; # Não é possível desbloquear uma conta que não está bloqueada ou está fechada
    }
}

sub edit_account {
    my ($self, $new_account_number) = @_;
    if ($self->{is_open} && !$self->{is_blocked}) {
        $self->{account_number} = $new_account_number;
        return 1;
    } else {
        return 0; # Não é possível editar uma conta bloqueada ou fechada
    }
}

1; # Verdadeiro para indicar que o módulo foi carregado com sucesso
