class IncomesController < ApplicationController

    before_filter :authorize
    
    def index
        @incomes = Income.where(:user_id => session[:user_id])
        @totalIncomes = calculate_monthly_income
    end

    def show
        @income = Income.find(params[:id])
    end

    def new
        @income = Income.new
        @frequencies = ["Weekly", "Bi-Weekly", "Monthly", "Semi-Monthly", "Quarterly", "Annually"]
    end

    def edit
        @income = Income.find(params[:id])
        @frequencies = ["Weekly", "Bi-Weekly", "Monthly", "Semi-Monthly", "Quarterly", "Annually"]
    end

    def create
        @income = Income.new(income_params)
        @income.user_id = session[:user_id]
        @frequencies = ["Weekly", "Bi-Weekly", "Monthly", "Semi-Monthly", "Quarterly", "Annually"]

        if @income.save
           redirect_to action: "index"
        else
           render 'new'
        end
    end

    def update
        @income = Income.find(params[:id])
        @frequencies = ["Weekly", "Bi-Weekly", "Monthly", "Semi-Monthly", "Quarterly", "Annually"]

        if @income.update(income_params)
            redirect_to action: 'index'
        else
            render 'edit'
        end
    end

    def destroy
        @income = Income.find(params[:id])
        @income.destroy

        redirect_to incomes_path
    end

    private
    def income_params
        params.require(:income).permit(:name, :amount, :frequency, :weekly_hours)
    end
end
