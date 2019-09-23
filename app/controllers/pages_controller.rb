class PagesController < ApplicationController
  def about
  end

  def sponsors
  end

  def cgu
  end

  def terms
  end

  def contact
  end

  def privacy
  end

  def error
  end

  def profil
    @user = User.find(params['id'])
  end


end
