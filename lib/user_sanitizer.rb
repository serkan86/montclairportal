class UserParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_up
    default_params.permit(:name, :email, :password, :password_confirmation, :time_zone) # TODO add other params here
  end

  def account_update
    default_params.permit(:name, :avatar, :email, :password, :password_confirmation, :time_zone, :current_password) # TODO add other params here
  end
end
