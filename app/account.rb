class Account
  attr_reader :value
  attr_accessor :transactions
  def initialize(owner)
    @owner = owner
    @value = 0.00
    @transactions = []
  end

  def deposit(money)
    if money >= 0
      @value += money
      transactions.push(Transactions.new(money, "deposit"))
    else
      "Cannot deposit negative value"
    end

  end

  def withdraw(money)
    if money >= 0
      @value -= money
      transactions.push(Transactions.new(money, "withdraw"))
    else
      "Cannot withdraw negative value"
    end
  end

  private
  class Transactions
    attr_reader :value, :action
    def initialize(money, action)
      @value = money
      @action = action
    end
  end
end
