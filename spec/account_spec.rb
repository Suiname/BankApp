require_relative '../app/account'
require_relative '../app/person'

describe Account do
  let(:acc) { Account.new(Person.new("John","Doe")) }
  describe '#value' do
    it 'has an initial value of zero dollars' do
      expect(acc.value).to eq 0.00
    end
  end

  describe '#deposit' do
    it 'adds deposit to value' do
      acc.deposit(100.00)
      expect(acc.value).to eq 100.00
    end

    it 'saves deposit transaction to transaction history' do
      acc.deposit(100.00)
      trans = acc.transactions.last

      expect(trans.value).to eq 100.00
      expect(trans.action).to eq 'deposit'
    end

    context 'negative deposit' do
      before do
        acc.deposit(-100.00)
      end

      it 'should return value of 0.00' do
        expect(acc.value).to eq 0.00
      end

      it 'does not create a transactions' do
        expect(acc.transactions.count).to eq 0
      end

      it 'returns a deposit error message' do
        expect(acc.deposit(-100)).to eq "Cannot deposit negative value"
      end
    end
  end

  describe '#withdraw' do
    before do
      acc.deposit(100.00)
    end

    it 'withdraws from value' do
      acc.withdraw(25.00)
      expect(acc.value).to eq 75.00
    end

    it 'creates withdraw transaction' do
      acc.withdraw(25.00)
      trans = acc.transactions.last

      expect(trans.value).to eq 25.00
      expect(trans.action).to eq 'withdraw'
    end

    context 'with negative value' do
      before do
        acc.withdraw(-25.00)
      end

      it 'should return original value' do
        expect(acc.value).to eq 100.00
      end

      it 'does not add transaction to transactions' do
        expect(acc.transactions.count).to eq 1
      end

      it 'returns withdraw error message' do
        expect(acc.withdraw(-25.00)).to eq "Cannot withdraw negative value"
      end
    end
  end
end
