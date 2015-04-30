class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.send_welcome(user).deliver!
  end
end
