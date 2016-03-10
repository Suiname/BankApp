class Bank
  attr_reader :bankname

  def initialize(bankname)
    @bankname = bankname
    @accounts = []
  end

  def accounts(*args)
    if args.size >= 1
      args.each do |e|
        @accounts.push(e)
      end
    else
      @accounts
    end
  end

  def customers
    @customers = []
    @accounts.each do |account|
      if !(@customers.include? account.owner)
        @customers.push(account.owner)
      end
    end
    @customers
  end
end
