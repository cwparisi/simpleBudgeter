class OverviewController < ApplicationController

  before_filter :authorize

  	def index
      handleDateSelection(params)

	    #get a batch of transaction for active month
      @monthsTransactions = Array.new
	    Transaction.where(:user_id => session[:user_id]).where(date: ($firstOfMonth..$lastOfMonth)).find_in_batches do |transactionsByMonth|
	    	@monthsTransactions = transactionsByMonth
	    end

      #Total expenses for month
      @totalExpenses = 0
      @monthsTransactions.each do |t|
        @totalExpenses += t.amount
      end

	    #Initialize array to store each fund's total charges for the month
	    @totalsArray = Array.new

	    #Get total transactions amounts for each fund
      @funds = Fund.where(:user_id => session[:user_id])
	    @funds.each do |fund|
	    	@total = 0
	      	if @monthsTransactions
		    	@monthsTransactions.each do |transaction|
		        	if transaction.fund_id == fund.id
		          	@total += transaction.amount
		        	end
		    	end
		    	@totalsArray << @total
		    else 
		    	@totalsArray << 0
		    end
	    end

      #Total fund amount
      @fundsTotal = 0
      @funds.each do |fund|
        @fundsTotal += fund.amount
      end

      if @fundsTotal != 0 #@totalExpenses != 0 and 
        #percentage of fund total spent
        @fundPercentage = ((@totalExpenses/@fundsTotal)*100).to_i
      end

      @totalIncomes = calculate_monthly_income
  	end

    def fund
      @fundName = Fund.find(params[:fund_id]).name
      
      handleDateSelection(params)

      @fundTransactions = Array.new
      Transaction.where(:user_id => session[:user_id]).where(:fund_id == params[:fund_id]).where(date: ($firstOfMonth..$lastOfMonth)).find_in_batches do |transactionsByFund|
        @fundTransactions = transactionsByFund
      end

    end

end
