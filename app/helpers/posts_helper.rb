module PostsHelper
  # Use in view: <%= render_post_content(post, number) %>
  def render_post_content(post, int)
    truncate(simple_format(post.content), length: int)
  end
end
