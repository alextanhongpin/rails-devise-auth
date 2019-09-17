class UserService
  class << self
    def get_users
      User.all
    end

    # def create_user(params)
    #   user = User.new(params)
    #   user.save!
    #   user
    # end
  end
end
