class UsersController < ApplicationController

  def index
    @users=User.order("created_at DESC")
  end
  def new
    @user=User.new
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to('index')
  end
end
