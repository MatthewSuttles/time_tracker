class RegistrationsController < Devise::RegistrationsController
  def update
    @user = User.find(current_user.id)
    params[:user][:current_password].delete if params[:user][:current_password]
    
    if can_update?
      @user.update_without_password(user_params)
      flash[:notice] = "update successful"
      sign_in @user, :bypass => true
      redirect_to :root
      
    else 
      flash[:error] = "update failed"
      render "edit"
    end
  end


  #these are to add a user with out signing up.
  def new_user
    @user = User.new
  end

  def add_user
    create_user
  end
  #################################################


  private
  def can_update?
      # if email is blank return false
      if params[:user][:email].blank?
        return false
        #if confirmation is blank return false
      elsif !params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        return false
      else 
        return true
      end 
  end
  
  def user_params
    params[:user].permit(:email, :password, :password_confirmation, :admin, :first_name, :last_name)
  end

  def create_user
    build_resource(user_params)
    if resource.save
     redirect_to users_path
   else
      flash[:error] = "failed"
      redirect_to users_path
   end

  end
  
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end


  
end
