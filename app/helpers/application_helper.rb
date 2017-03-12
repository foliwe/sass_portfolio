module ApplicationHelper

  def login_in_helper
    if current_user.is_a?(GuestUser) #User here is the Super class for the User model
     ( link_to 'Login',  new_user_session_path) +
      "<br>".html_safe +
      (link_to 'Register',  new_user_registration_path )
    else
      link_to 'Logout', destroy_user_session_path, method: :delete 
    end
  end

  def source_helper
     if session[:source]
    content_tag(:p, "Thanks for visiting me from #{session[:source]}",class:"session-source")
    end
  end
  

  def copyrigthEngine
    UtakaViewTool::Renderer.copyright('SassPortfolio','All rights reserved' )
  end
end

