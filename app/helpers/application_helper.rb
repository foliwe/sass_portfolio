module ApplicationHelper

  def login_in_helper style = ''
    if current_user.is_a?(GuestUser) #User here is the Super class for the User model
     ( link_to 'Login',  new_user_session_path, class: style) +
      " ".html_safe +
      (link_to 'Register',  new_user_registration_path , class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete , class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
  

  def copyrigthEngine
    UtakaViewTool::Renderer.copyright('SassPortfolio','All rights reserved' )
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },

      {
        url: about_path,
        title: "About"
      },

      {
        url: blogs_path,
        title: "Blog"
      },

      {
        url: portfolios_path,
        title: "Portfolios"
      },

      {
        url: contact_path,
        title: "Contact"
      }
    ]
  end

  def nav_helper style,tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"

    end

#nav_links = <<NAV < --Normal Method with watchdog -->
#<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
#<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{tag_type}>
#<#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolios</a></#{tag_type}>
#<#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
#NAV

    nav_links.html_safe

  end

  def active? path
    "active" if current_page? path
  end
end

