require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "home page" do
    before{ visit root_path }

    it { should have_content("事件") }
  end

end
