class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseParams
  include SetSource
  include GuestUser
  include DefaultPageContent
end