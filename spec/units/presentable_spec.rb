require "spec_helper"
require "active_support/concern"
require "presenter_object/presentable"
require "support/mocks"

class User
  include PresenterObject::Presentable
end

describe PresenterObject::Presentable do
  let(:user) { User.new }
  let(:view_context) { double "view_context" }

  context "#presenterize" do
    it "returns the object wrapped in its presenter" do
      expect(user.presenterize).to be_kind_of UserPresenter
    end

    it "accepts the view_context as an optional argument" do
      u = user.presenterize view_context
      expect(u.view_context).to be view_context
    end
  end

  context ".presenter_class" do
    it "is the presenter class" do
      expect(User.presenter_class).to be UserPresenter
    end
  end
end
