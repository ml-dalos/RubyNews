class UsersController < ApplicationController
  def update
    helpers.current_user.update(sources: sources)
    redirect_to root_path
  end

  private

  def sources
    sources = []
    params.each_pair { |key, value| sources << key if value == '1' }
    sources
  end

end
