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


end
