class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    #@favorites_count = 
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def show
    @topic = Topic.find_by(id.params[:id])
    @user = @topic.user
    @favorites_count = favorite.where(topic_id: @topic_id).count
  end  

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
 
end