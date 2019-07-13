class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    if @user != current_user
      return render plain: 'Not allowed', status: :forbidden
    end
  end

end
