class MessagesController < ApplicationController

  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      # redirectの前はflash
      # redirect_toはHTTPリクエストを発生させる
      flash[:success] = "Messageが投稿されました。"
      redirect_to @message
    else
      # renderの前はflash.now
      # renderはHTTPリクエストを発生させない
      flash.now[:danger] = "Messageが投稿されませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      flash[:success] = "Messageは更新されました"
      redirect_to @message
    else
      flash.now[:danger] = "Messageが更新されませんでした"
      render :edit
    end
  end

  def destroy
    @message.destroy

    flash[:success] = "Messageは削除されました"
    redirect_to root_url # redirectの場合はprefix_urlの形になる
  end

  private

  # Strong Parameter
  def message_params
    # Messageフォームのフォームから得られるcontentカラムの内容だけをフィルタリング
    params.require(:message).permit(:content, :title)
  end

  def set_message
    @message = Message.find(params[:id])
  end

end

