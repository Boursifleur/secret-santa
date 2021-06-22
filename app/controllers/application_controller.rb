class ApplicationController < ActionController::Base

 def after_sign_in_path_for(resource)
  if session[:user_return_to] == nil
    events_path
  else
    super
  end
end
end
