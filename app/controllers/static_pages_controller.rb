class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @artworks = Artwork.my_collection(current_user)
      render 'userhome'
    else
      render 'home'
    end
  end

  def help
  end

  def about
  end
end
