class ListsController < ApplicationController
    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to root_path
            flash[:success] = "创建成功 记住完成该事件哦"
        else
            flash[:error] = "创建失败"
            redirect_to root_path
        end
    end
 
    def destroy
        @list = List.find(params[:id])
        @list.delete
        flash[:success] = "亲 恭喜你又完成一件事情"
        redirect_to root_path
    end
    
    def edit
        @list = List.find(params[:id])
    end

    def update
        @list = List.find(params[:id])
        if @list.update_attributes(list_params)
            redirect_to root_path
            flash[:success] = "修改成功"
        else
            flash[:error] = "修改失败"
            render 'lists/edit'
        end
    end

    private 

        def list_params
            params.require(:list).permit(:content)
        end
end
