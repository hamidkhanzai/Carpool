class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.Admin?
      @users= User.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
     render  'list'
    else
      @user=User.find(current_user.id)
    end



    #
    #   #Post.page(params[:page]).order('created_at DESC')

  end

  def list

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
    redirect_to(:action=>'index')
  end
end
