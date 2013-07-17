class CarsController < ApplicationController

 def index
      if current_user.Admin?
      @cars=Car.all
      else
        if current_user.isDriver?
        @cars=Car.where(:user_id => current_user.id)
        else
          redirect_to pages_home_path
          end
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
