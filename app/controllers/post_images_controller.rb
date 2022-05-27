class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    # 投稿するデータを PostImage モデルに紐づくデータとして保存する準備をしていて
    # フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納される
    @post_image.user_id = current_user.id
    # @post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に
    # 指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
