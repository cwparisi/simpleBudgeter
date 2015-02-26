class FundsController < ApplicationController

  before_filter :authorize
  
  def index
    @funds = Fund.where(:user_id => session[:user_id])
    @fundsTotal = getTotalAmount
    @totalIncomes = calculate_monthly_income
    if @fundsTotal != 0 and @totalIncomes != 0
      @percentage = ((@fundsTotal/@totalIncomes)*100).to_i
    end
  end

  def show
    @fund = Fund.find(params[:id])
  end

  def new
    @icons = [
      "home", 
      "shopping-cart",
      "lightbulb-o",
      "phone",
      "stethoscope",
      "child",
      "coffee",
      "book",
      "cutlery",
      "gamepad",
      "heart",
      "music",
      "paw",
      "ticket",
      "wrench",
      "wifi",
      "credit-card",
      "car",
      "bicycle",
      "bus",
      "taxi",
      "motorcycle",
      "plane",
      "subway",
      "train",
      "truck",
      "bank",
      "money",
      "ambulance",
      "hospital-o",
      "heartbeat",
      "medkit",
      "user-md",
      "wheelchair",
      "scissors",
      "bed",
      "beer",
      "birthday-cake",
      "bolt",
      "building",
      "bullseye",
      "camera",
      "cog",
      "desktop",
      "diamond",
      "dot-circle-o",
      "envelope",
      "eye",
      "female",
      "male",
      "film",
      "flask",
      "futbol-o",
      "gift",
      "graduation-cap",
      "group",
      "headphones",
      "keyboard-o",
      "laptop",
      "leaf",
      "lock",
      "newspaper-o",
      "paint-brush",
      "pencil",
      "plug",
      "puzzle-piece",
      "road",
      "thumb-tack",
      "trash",
      "tree",
      "trophy",
      "wrench"
    ]
    @colors = ["#F44336", "#E91E63", "#9C27B0", "#673AB7", "#3F51B5", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50", "#8BC34A", "#CDDC39", "#FFC107", "#FF9800", "#FF5722", "#795548", "#9E9E9E", "#607D8B"]
    @fund = Fund.new
  end

  def edit
    @icons = [
      "home", 
      "shopping-cart",
      "lightbulb-o",
      "phone",
      "stethoscope",
      "child",
      "coffee",
      "book",
      "cutlery",
      "gamepad",
      "heart",
      "music",
      "paw",
      "ticket",
      "wrench",
      "wifi",
      "credit-card",
      "car",
      "bicycle",
      "bus",
      "taxi",
      "motorcycle",
      "plane",
      "subway",
      "train",
      "truck",
      "bank",
      "money",
      "ambulance",
      "hospital-o",
      "heartbeat",
      "medkit",
      "user-md",
      "wheelchair",
      "scissors",
      "bed",
      "beer",
      "birthday-cake",
      "bolt",
      "building",
      "bullseye",
      "camera",
      "cog",
      "desktop",
      "diamond",
      "dot-circle-o",
      "envelope",
      "eye",
      "female",
      "male",
      "film",
      "flask",
      "futbol-o",
      "gift",
      "graduation-cap",
      "group",
      "headphones",
      "keyboard-o",
      "laptop",
      "leaf",
      "lock",
      "newspaper-o",
      "paint-brush",
      "pencil",
      "plug",
      "puzzle-piece",
      "road",
      "thumb-tack",
      "trash",
      "tree",
      "trophy",
      "wrench"
    ]
    @colors = ["#F44336", "#E91E63", "#9C27B0", "#673AB7", "#3F51B5", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50", "#8BC34A", "#CDDC39", "#FFC107", "#FF9800", "#FF5722", "#795548", "#9E9E9E", "#607D8B"]
    @fund = Fund.find(params[:id])
  end

  def create
    @icons = [
      "home", 
      "shopping-cart",
      "lightbulb-o",
      "phone",
      "stethoscope",
      "child",
      "coffee",
      "book",
      "cutlery",
      "gamepad",
      "heart",
      "music",
      "paw",
      "ticket",
      "wrench",
      "wifi",
      "credit-card",
      "car",
      "bicycle",
      "bus",
      "taxi",
      "motorcycle",
      "plane",
      "subway",
      "train",
      "truck",
      "bank",
      "money",
      "ambulance",
      "hospital-o",
      "heartbeat",
      "medkit",
      "user-md",
      "wheelchair",
      "scissors",
      "bed",
      "beer",
      "birthday-cake",
      "bolt",
      "building",
      "bullseye",
      "camera",
      "cog",
      "desktop",
      "diamond",
      "dot-circle-o",
      "envelope",
      "eye",
      "female",
      "male",
      "film",
      "flask",
      "futbol-o",
      "gift",
      "graduation-cap",
      "group",
      "headphones",
      "keyboard-o",
      "laptop",
      "leaf",
      "lock",
      "newspaper-o",
      "paint-brush",
      "pencil",
      "plug",
      "puzzle-piece",
      "road",
      "thumb-tack",
      "trash",
      "tree",
      "trophy",
      "wrench"
    ]
    @colors = ["#F44336", "#E91E63", "#9C27B0", "#673AB7", "#3F51B5", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50", "#8BC34A", "#CDDC39", "#FFC107", "#FF9800", "#FF5722", "#795548", "#9E9E9E", "#607D8B"]
    @fund = Fund.new(fund_params)
    @fund.user_id = session[:user_id]
 
    if @fund.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @icons = [
      "home", 
      "shopping-cart",
      "lightbulb-o",
      "phone",
      "stethoscope",
      "child",
      "coffee",
      "book",
      "cutlery",
      "gamepad",
      "heart",
      "music",
      "paw",
      "ticket",
      "wrench",
      "wifi",
      "credit-card",
      "car",
      "bicycle",
      "bus",
      "taxi",
      "motorcycle",
      "plane",
      "subway",
      "train",
      "truck",
      "bank",
      "money",
      "ambulance",
      "hospital-o",
      "heartbeat",
      "medkit",
      "user-md",
      "wheelchair",
      "scissors",
      "bed",
      "beer",
      "birthday-cake",
      "bolt",
      "building",
      "bullseye",
      "camera",
      "cog",
      "desktop",
      "diamond",
      "dot-circle-o",
      "envelope",
      "eye",
      "female",
      "male",
      "film",
      "flask",
      "futbol-o",
      "gift",
      "graduation-cap",
      "group",
      "headphones",
      "keyboard-o",
      "laptop",
      "leaf",
      "lock",
      "newspaper-o",
      "paint-brush",
      "pencil",
      "plug",
      "puzzle-piece",
      "road",
      "thumb-tack",
      "trash",
      "tree",
      "trophy",
      "wrench"
    ]
    @colors = ["#F44336", "#E91E63", "#9C27B0", "#673AB7", "#3F51B5", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50", "#8BC34A", "#CDDC39", "#FFC107", "#FF9800", "#FF5722", "#795548", "#9E9E9E", "#607D8B"]
    @fund = Fund.find(params[:id])
   
    if @fund.update(fund_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def destroy
    @fund = Fund.find(params[:id])
    @fund.destroy
   
    redirect_to funds_path
  end

  def getTotalAmount
    @total = 0
    @funds.each do |fund|
      @total += fund.amount
    end
    return @total
  end

  private
    def fund_params
      params.require(:fund).permit(:name, :amount, :color, :iconUrl)
    end
end
