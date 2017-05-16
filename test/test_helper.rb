require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # def sign_in(new_user)
  #   post user_session_path, 'user[email]' => new_user.email, 'user[password]' => new_user.password
  # end
end

# class ActionController::TestCase
#   include Devise::TestHelpers
# end
