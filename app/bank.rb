class Bank
  attr_reader :bankname

  def initialize(bankname)
    @bankname = bankname
    @accounts = []
  end

  def accounts
    @accounts
  end

  def accounts(account)
    @accounts.push(account)
  end


end
