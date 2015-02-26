class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def authorize_admin
    redirect_to '/overview' unless current_user.admin == true
  end

  def calculate_monthly_income
        @runningTotal = 0
        @incomes = Income.where(:user_id => session[:user_id])
        @incomes.each do |income|
            case income.frequency
                when "Weekly" then @runningTotal = @runningTotal + (income.amount*52)/12 #(yearlyAmount)/12months
                when "Bi-Weekly" then @runningTotal = @runningTotal + ((income.amount/2)*52)/12 #((weeklyAmount)*weeksPerYear)/12months
                when "Monthly" then @runningTotal = @runningTotal + income.amount
                when "Semi-Monthly" then @runningTotal = @runningTotal + income.amount*2
                when "Quarterly" then @runningTotal = @runningTotal + income.amount/4
                when "Annually" then @runningTotal = @runningTotal + income.amount/12
                else @runningTotal = @runningTotal + 0
            end
        end
        return @runningTotal
  end

  def handleDateSelection(params)
    if params[:monthYear]
        $currentDate = Date.new(params[:monthYear][2..5].to_i, params[:monthYear][0..1].to_i)
        $currentMonth = $currentDate.mon
        $currentYear = $currentDate.year
        $currentDatePrev = $currentDate << 1
        $currentDateNext = $currentDate >> 1
      else
        $currentDate = Time.new.to_date
        $currentMonth = $currentDate.mon
        $currentYear = $currentDate.year
        $currentDatePrev = $currentDate << 1
        $currentDateNext = $currentDate >> 1
      end

      $firstOfMonth = Date.new($currentYear, $currentMonth, 1)
      $lastOfMonth = (($firstOfMonth >> 1) - 1)
  end
end
