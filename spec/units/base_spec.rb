require "spec_helper"
require "active_support/core_ext/string/inflections"
require "presenter_object/base"
require "support/mocks"

describe PresenterObject::Base do
  let(:user) { User.new }
  let(:post) { Post.new }
  let(:user_presenter) { UserPresenter.new user }

  context ".presents" do
    before(:each) { described_class.presents :something_cool }

    it "takes the lowercased model_name and infers the class name" do
      expect(described_class.instance_variable_get :@class_name).to eq "SomethingCool"
    end

    it "registers itself as a presenter of the wrapped object's class" do
      expect(described_class.presenters).to have_key "SomethingCool"
    end
  end

  context ".presented_class" do
    it "is the wrapped object's class" do
      expect(UserPresenter.presented_class).to be User
    end
  end

  context ".presenters" do
    it "is a hash of registered presenters to their wrapped object's class" do
      expect(described_class.presenters.keys).to include *["Post", "User"]
      expect(described_class.presenters.values).to include *[UserPresenter, PostPresenter]
    end

    it "is shared across all subclasses" do
      expect(UserPresenter.presenters.keys).to include *["Post", "User"]
      expect(PostPresenter.presenters.keys).to include *["Post", "User"]
    end
  end

  context "#object" do
    it "is the wrapped object" do
      expect(UserPresenter.new(user).object).to be user
    end
  end

  context "#class" do
    it "is the wrapped object's class" do
      expect(PostPresenter.new(post).class).to be Post
    end
  end

  context "Delegation" do
    it "delegates methods to the wrapped object" do
      expect(user).to receive(:model_method).and_return "called model method"
      user_presenter.model_method
    end

    it "handles its own methods" do
      expect(user_presenter).to receive(:presenter_method).and_return "called presenter method"
      user_presenter.presenter_method
    end

    it "raise NoMethodError when neither presenter nor wrapped object respond_to a method" do
      expect { user_presenter.non_existent }.to raise_error(NoMethodError)
    end
  end
end
