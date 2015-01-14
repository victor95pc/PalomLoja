require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  should     validate_confirmation_of :password
  should     allow_value('email@addresse.foo').for(:email)
  should_not allow_value('foo').for(:email)

  [:email, :password].each { |key| should validate_presence_of(key) }


  context 'password' do
    subject { AdminUser.new email: 'victor@email.com' }
    should ensure_length_of(:password).is_at_least(8).is_at_most(25)
  end
end
