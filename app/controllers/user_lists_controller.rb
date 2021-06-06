class UserListsController < ApplicationController
  def index
    @users = User.all
  end
end
