class CarsController < ApplicationController

 def index
      if current_user.Admin?
      @cars=Car.all
      else
        @cars=Car.where(:user_id => current_user.id)
      end

 end

 def new
 @car=Car.new
 @car.user_id=current_user.id
 end

 def create
    @car=Car.new(params[:car])
  if @car.save
   redirect_to :action=> "index"
  else
    render :action => "new"
  end

 end

  def edit
    @car=Car.find(params[:id])
  end

  def update
    @car=Car.find(params[:id])
    if @car.update_attributes(params[:car])
      redirect_to(:action=>'index')
    else
      render 'edit'
    end
  end
end
