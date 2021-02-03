class ItemsController < ApplicationController
  def index
    @user = User.all
  end
end
