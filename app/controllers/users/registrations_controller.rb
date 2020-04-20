class Users::RegistrationsController < Devise::RegistrationsController

	def create
		build_resource(registration_params)

		if resource.save
		  if resource.active_for_authentication?
		    set_flash_message :notice, :signed_up if is_navigational_format?
		    sign_up(resource_name, resource)
		    return render :json => {:success => true, :redirect=> root_url}
		  else
		    set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
		    expire_session_data_after_sign_in!
		    return render :json => {:success => true}
		  end
		else
		  clean_up_passwords resource
		  error_messages = resource.errors.messages.first.join(' ') unless resource.errors.messages.blank?
		  return render :json => {:success => false,:errors=>error_messages}
		end
	end
 
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
   root_url
  end

  private
  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation,:name,:gender)
  end


end