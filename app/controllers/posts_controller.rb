class PostsController < ApplicationController
    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, notice: '知らせてくれてありがとう'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def index
      if Post.count >= 3
        @posts = Post.order("RANDOM()").limit(3)
      else
        # 3件未満の場合は全て表示（新しい順）
        @posts = Post.order(created_at: :desc)
      end
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end
end
