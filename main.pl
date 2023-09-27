use BankAccount;
use AccountManagement;

my $account = BankAccount->new("12345", 1000);
$account->deposit(500);
$account->withdraw(200);

# Gerenciamento de conta
AccountManagement::open_account($account);
AccountManagement::block_account($account);
AccountManagement::unblock_account($account);
AccountManagement::edit_account($account, "67890");

my $balance = $account->get_balance();
print "Saldo da conta: $balance\n";
