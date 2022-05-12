class NewUsersController < Clearance::UsersController
  def new
    @user = user_from_params
    render template: "users/new"
  end
end
