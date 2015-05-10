class UsersController < ApplicationController
  before_action :set_password_confirmation, only: [:create, :update]
  expose(:users)
  expose(:user, attributes: :user_params)

  def create
    if user.save
      redirect_to user_path(user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user.update(user_params)
      redirect_to user_path(user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_password_confirmation
    user.password_confirmation = user.password
  end

    def user_params
      params.require(:user).permit(:name, :last_name, :birth_date, :school_class, :email, :admin, :password)
    end
end
