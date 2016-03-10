require_relative '../app/bank'
require_relative '../app/account'
require_relative '../app/person'

describe Bank do
  let(:bank) { Bank.new("The Bank") }
  let(:account1) {Account.new(Person.new("John", "Doe"))}
  let(:account2) {Account.new(Person.new("John", "Doe"))}
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
    end


  end
end
