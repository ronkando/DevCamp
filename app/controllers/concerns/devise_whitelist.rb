module DeviseWhitelist
  extend ActiveSupport::Concern

  included  do
    before_action :config_permitted_parms , if: :devise_controller?

    def config_permitted_parms
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end
end