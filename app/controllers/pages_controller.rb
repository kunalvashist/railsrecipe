class PagesController < ApplicationController
  def home
    redirect_to recipes_path if loggedin?
  end
end
