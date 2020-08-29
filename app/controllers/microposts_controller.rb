class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    #投稿情報をdestroyで削除
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
    #rideirect_backでアクションが実行されたページに戻る
    #fallback_location: root_path は、戻るべきページがない場合には root_path に戻る
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  #現在のログインユーザー情報が投稿されたユーザー情報と合致するか確認
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    #current_user.micropostsでログインユーザーのmicropostsの情報内を検索して結果が返ってくるか確認
    unless @micropost
      redirect_to root_url
    end
  end
end