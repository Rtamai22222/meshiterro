class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id #current_userはdeviseのヘルパーメソッド。ログイン中のユーザーの情報を取得できる。current_user.XX のように扱う.id //.name //.emailなど
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end
  
  def destroy
  end
  
  
  private
  
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
  
end
