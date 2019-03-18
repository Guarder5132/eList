require 'spec_helper'

describe "StaticPages" do
  before { @list = List.new(content: "赚他个一个亿") }

  subject { page }

  describe "home page" do
    before do 
      @list.save
      visit root_path
    end

    it { should have_title(full_title('')) }
    it { should have_content("想做的事情") }
    it { should have_content(List.count) }
    it { should_not have_title('| Home') }

    describe "redirect_to page" do
      it { should have_link("关于我们",  href:about_path) }
      it { should have_link("帮助",     href:help_path) }
      it { should have_link("联系",     href:contact_path) }
      it { should have_link("主页",     href:root_path) }
      it { should have_link("编辑",     href:edit_list_path(@list)) }
    end

    describe "delete" do
      it "删除成功" do
        expect { click_link "删除" }.to change(List, :count).by(-1)
      end
    end
  end

  describe "help page" do
    before { visit help_path }

    it { should have_title(full_title('Help')) }
    it { should have_content("Help") }
  end

  describe "about page" do
    before { visit about_path }

    it { should have_title(full_title('About')) }
    it { should have_content("About") }
  end

  describe "contact page" do
    before { visit contact_path }

    it { should have_title(full_title('Contact')) }
    it { should have_content("Contact") }
  end

  describe "post list" do
    before { visit root_path }

    describe "信息有效时" do
      before { fill_in "list_content", with: "huahua" }
      it "应该创建成功" do  
        expect{ click_button "创建" }.to change(List, :count).by(1)
      end

      describe "成功后" do
        before { click_button "创建" }
        it { should have_content("huahua") }
        it { should have_selector('div.alert.alert-success', text:"创建成功") }
      end
    end

    describe "信息无效时" do
      it "应该创建失败" do
        expect{ click_button "创建" }.not_to change(List, :count)
      end

      describe "失败后" do
        before { click_button "创建" }
        it { should have_selector('div.alert.alert-error', text:"创建失败") }
      end
    end
  end

end
