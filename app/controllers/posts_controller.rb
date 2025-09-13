class PostsController < AplicationController
    def top
        @post = Post.new
    end

    def index
        @posts = Post.order(created_at: :desc)
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render :top, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end
end