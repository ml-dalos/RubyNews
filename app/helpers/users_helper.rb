module UsersHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def source?(source)
    current_user.sources.include?(source.to_s)
  end
end
