class UsersController < ApplicationController
  before_filter :authenticate_user! ,:except => :home

  def home
    render 'users/home'
  end

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


  def admin
    if current_user.Admin?
    @user=User.find(params[:id])
    if @user.update_attribute(:Admin,'true')

      flash[:notice] = "User successfully Promoted to Admin"
    else
      flash[:alert]= "Could not promote user to Admin"
    end
    end
    index
  end
  def promote
  if current_user.Admin?
    @user=User.find(params[:id])

    if @user.update_attribute(:isDriver,'true')
      flash[:notice] = "User successfully Promoted"
      redirect_to (users_path)
    else
      flash[:alert]= "There are Some problems please try again"
      render 'accounts/list'
    end
   end
  end
end
