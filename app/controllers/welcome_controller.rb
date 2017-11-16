class WelcomeController < ApplicationController
  def index
    redirect_to '/login' unless helpers.current_user
    @news = params[:source] ? check_source : News.where(source: helpers.current_user.sources)
  end

  private

  def check_source
    if helpers.current_user.sources.include?(params[:source])
      News.where(source: params[:source])
    else
      redirect_to '/weather'
    end
  end

end
