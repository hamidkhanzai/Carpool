class FbookController < Devise::OmniauthCallbacksController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    render :text => auth_hash.info.image

  end
  def facebook
   # auth_hash = request.env['omniauth.auth']

    #render :text =>  auth_hash.info.image
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      flash[:notice]="Successfully login" if is_navigational_format?

    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def failure

  end
end
