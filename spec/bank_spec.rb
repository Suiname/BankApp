require_relative '../app/bank'
require_relative '../app/account'
require_relative '../app/person'

describe Bank do
  let(:bank) { Bank.new("The Bank") }
  let(:person1) {Person.new("John", "Doe")}
  let(:person2) {Person.new("Jane", "Doe")}
  let(:account1) {Account.new(person1)}
  let(:account2) {Account.new(person1)}
  let(:account3) {Account.new(person2)}
  describe '#bankname' do
    it 'has name of The Bank' do
      expect(bank.bankname).to eq "The Bank"
    end
  end
  describe '#accounts' do
    context 'many accounts' do
      before do
        bank.accounts(account1)
        bank.accounts(account2)
      end
      it 'can see all accounts' do
        expect(bank.accounts).to eq [account1, account2]
      end
      it 'has many accounts' do
        expect(bank.accounts.count).to eq 2
      end
      it 'has multiple accounts that belong to 1 person' do
        expect(bank.accounts.count).to be > (bank.customers.count)
      end
    end
  end
  describe '#customers' do
    context 'open multiple accounts with different customers' do
      before do
        bank.accounts(account1)
        bank.accounts(account3)
      end
      it 'can see all people who have accounts' do
        expect(bank.customers).to eq [person1, person2]
      end
    end

  end
end
