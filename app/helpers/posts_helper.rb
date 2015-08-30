module PostsHelper
  # Use in view: <%= render_post_content(post, number) %>
  def render_post_content(post, int)
    simple_format(truncate(post.content), length: int)
  end
end
