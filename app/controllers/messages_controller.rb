class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
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

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.save
      flash[:success] = "Messageは更新されました"
      redirect_to @message
    else
      flash.now[:danger] = "Messageが更新されませんでした"
      render :edit
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    flash[:success] = "Messageは削除されました"
    redirect_to messages_url # redirectの場合はprefix_urlの形になる
  end

  private

  # Strong Parameter
  def message_params
    # Messageフォームのフォームから得られるcontentカラムの内容だけをフィルタリング
    params.require(:message).permit(:content)
  end

end

