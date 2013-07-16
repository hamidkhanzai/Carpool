class AccountsController < ApplicationController
  before_filter :authenticate_user!
  def index

  end
  def new

     @account=Account.new
  end
  def create
    @account=Account.new(params[:account])
    @account.user_id=current_user.id
    if @account.save
      flash[:notice] = "Your request sent Successfully. Thanks!"
      redirect_to (pages_home_path )
    else
      flash[:alert]="There was Some problem Please try Again!"
      render 'new'
    end
  end
  def list
    if current_user.Admin?
      @accounts=Account.where("checked=?",false).paginate(:page => params[:page], :per_page => 5)
    else
      flash[:alert]="You don't have Access to these contents"
      redirect_to (pages_home_path)

    end

  end
  def check
    if current_user.Admin?
      @account=Account.find(params[:id])

      if @account.update_attribute(:checked,'true')
        flash[:notice] = "User successfully checked"
        redirect_to(:action =>'list')
      else
        flash[:alert]= "There are Some problems please try again"
        render 'accounts/list'
      end
    end

  end

  def destroy
    @account=Account.find(params[:id])
    @account.destroy
    redirect_to :action => 'list'
  end
end
