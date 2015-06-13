def require_logged_in
  redirect('/') unless is_authenticated?
end

def is_authenticated?
  return !!session[:user_id]
end


def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end