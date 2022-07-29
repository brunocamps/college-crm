class ApplicationController < ActionController::Base
    before_action :authenticate_user! # MARK: Important
end 
