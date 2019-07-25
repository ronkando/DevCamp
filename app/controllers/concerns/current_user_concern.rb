module CurrentUserConcern
  extend ActiveSupport::Concern

  included  do

    def current_user
      super || guest_user
    end

    def guest_user
      OpenStruct.new(name:"Guest User",
                            first_name:"Guest",
                            last_name: "User",
                            email: "User@User.com")
    end
  end
end