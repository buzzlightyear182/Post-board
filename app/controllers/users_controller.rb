class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to dashboard_path
    else
      render template: 'users/new'
    end
  end

  private

  def user_from_params

    #For creating username (not included in Clearance)
    username = user_params.delete(:username)

    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.username = username
      user.email = email
      user.password = password
    end
  end
end
