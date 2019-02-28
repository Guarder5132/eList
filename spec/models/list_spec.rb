require 'spec_helper'

describe List do
  
  before { @list = List.new(content: "今天要买药吃") }

  subject { @list }

  it { should respond_to(:content) }

  describe "content" do

    describe "当内容为空是" do
      before { @list.content = "" }
      it { should_not be_valid }
    end

    describe "当内容过长是" do
      before { @list.content = "a"*51 }
      it { should_not be_valid }
    end
  end
  
end
