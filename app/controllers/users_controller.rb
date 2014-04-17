class UsersController < ApplicationController
  def dashboard
    @templates = current_user.templates
  end
end
