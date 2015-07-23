require "json"

module MyHooks
  class << self
    def path(post)
      File.basename(post.name, ".*") + ".json"
    end
    def dest(post)
      File.join(post.site.dest, path(post))
    end
    def build_entry(post, with_body: true)
      path = MyHooks.path(post)
      dest = MyHooks.dest(post)
      entry = post.data.merge(
        "path" => path,
        "dest" => dest,
        "excerpt" => post.excerpt
        )
      if with_body
        entry["body"] = post.content
      end
      entry
    end
  end
end

Jekyll::Hooks.register :post, :post_render do |post|
  json_post = MyHooks.build_entry(post)
  dest = json_post["dest"]
  File.write(dest, JSON.pretty_generate(json_post))
  post.site.keep_files << dest
end

Jekyll::Hooks.register :site, :post_write do |site|
  site_json = {
    posts: site.posts.map do |post|
      MyHooks.build_entry(post, with_body: false)
    end
  }
  File.write(File.join(site.dest, "posts.json"), JSON.pretty_generate(site_json))
end
