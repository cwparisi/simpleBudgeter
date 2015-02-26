class TransactionsController < ApplicationController

  before_filter :authorize

  def index
    handleDateSelection(params)

    @monthsTransactions = Array.new
    #get a batch of transaction for active month
    Transaction.where(:user_id => session[:user_id]).where(date: ($firstOfMonth..$lastOfMonth)).find_in_batches do |transactionsByMonth|
      @monthsTransactions = transactionsByMonth
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = session[:user_id]
 
    if @transaction.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
   
    redirect_to transactions_path
  end

  private
    def transaction_params
      params.require(:transaction).permit(:location, :amount, :date, :fund_id, :transactionType, :user_id, :description)
    end
  
end
