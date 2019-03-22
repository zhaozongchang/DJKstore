class WelcomeController < ApplicationController
  def index
    flash[:notice] = "欢迎来到 DJKstore"
  end
end
