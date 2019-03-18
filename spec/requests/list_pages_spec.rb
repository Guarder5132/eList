require 'spec_helper'

describe "ListPages" do
    before { @list = List.new(content: "赚他个一个亿") }

    subject { page }

    describe "edit page" do
        before do
            @list.save
            visit edit_list_path(@list) 
        end
        it { should have_title(full_title('Edit')) }

        describe "edit" do
            let(:new_content) { "赚两个亿,一个亿不够" }
            describe "编辑失败" do

                before do 
                    fill_in "list_content",    with:" "
                    click_button "更改"
                end

                it { should have_title('Edit') }
                it { should have_selector('div.alert.alert-error', text:"修改失败") }
            end 

            describe "编辑成功" do

                before do 
                    fill_in "list_content" ,with: new_content
                    click_button "更改"
                end

                it { should have_title(full_title('')) }
                it { should have_selector('div.alert.alert-success', text:'修改成功') }
                it { should have_content(new_content) }
                specify { expect(@list.reload.content).to eq new_content }
            end 
        end
    end

end
