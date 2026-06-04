# Local-only compatibility shim.
#
# Ruby 3.2 removed Object#tainted?/#untaint, but the github-pages-pinned
# Liquid 4.0.3 still calls them. This restores no-op versions so the old
# Jekyll/Liquid stack can run on modern Ruby for local `jekyll serve`.
#
# GitHub Pages always builds in safe mode, where files in _plugins/ are
# ignored, so this has no effect on the deployed site.
class Object
  def tainted?
    false
  end unless method_defined?(:tainted?)

  def untaint
    self
  end unless method_defined?(:untaint)
end
