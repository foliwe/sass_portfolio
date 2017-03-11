module ApplicationHelper

  def login_in_helper
    if current_user.is_a?(User) #User here is the Super class for the User model
    link_to 'Logout', destroy_user_session_path, method: :delete 
    else
    (link_to 'Register',  new_user_registration_path ) + 
    "<br>".html_safe +
    (link_to 'Login',  new_user_session_path)
  end
  end
end

