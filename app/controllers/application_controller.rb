class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseParams
  include SetSource
  include GuestUserConcern
  include DefaultPageContent
end