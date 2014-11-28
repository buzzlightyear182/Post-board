class UsersController < Clearance::UsersController
  respond_to :html

  def index
    @users = User.all
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to dashboard_path
    else
      render template: 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_from_params

    #For creating username (not included in Clearance)
    user_params = params[:user] || Hash.new
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
