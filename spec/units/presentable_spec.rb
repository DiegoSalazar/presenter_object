require "spec_helper"

describe PresenterObject::Presentable do
  let(:user) { PresentableUser.new }
  let(:view_context) { double "view_context" }

  context "#presenterize" do
    it "returns the object wrapped in its presenter" do
      expect(user.presenterize).to be_kind_of PresentableUserPresenter
    end

    it "accepts the view_context as an optional argument" do
      u = user.presenterize view_context
      expect(u.view_context).to be view_context
    end
  end

  context ".presenter_class" do
    it "is the presenter class" do
      expect(PresentableUser.presenter_class).to be PresentableUserPresenter
    end
  end
end
