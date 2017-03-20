class RegistrationsControllerController < ApplicationController
  def create

debugger

      if params[:autorizzo] && verify_recaptcha
        super
      else
        build_resource(sign_up_params)
        clean_up_passwords(resource)
        if params[:autorizzo].nil? && !verify_recaptcha
          flash.now[:alert] = "You did not agree and missing captcha"
        elsif params[:autorizzo].nil?
          flash.now[:alert] = "You did not agree"
        elsif !verify_recaptcha
          flash.now[:alert] = "captcha not correct"
        end
        flash.delete :recaptcha_error
        render :new
      end
  end
	
end
