class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def permitted_params
    @permitted_params ||= PermittedParams.new(params)
  end
  helper_method :permitted_params
  
end