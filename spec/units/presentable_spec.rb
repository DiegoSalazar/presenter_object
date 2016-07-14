require "spec_helper"
require "active_support/concern"
require "presenter_object/presentable"
require "support/mocks"

class User
  include PresenterObject::Presentable
end

describe PresenterObject::Presentable do
  context "#presenterize" do
    let(:user) { User.new }

    it "returns the object wrapped in its presenter" do
      expect(user.presenterize).to be_a UserPresenter
    end
  end
end
