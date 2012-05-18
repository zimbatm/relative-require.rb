module Kernel
  ##
  # The Kernel#require from before Relative was loaded.
  alias rel_original_require require

  ##
  # When relative is required, Kernel#require is replaces with
  # our own which is capable of loading files relatively.
  #
  # The meaning of ./ is replaced with "relative to the directory
  # of the file that has called require"
  #
  # The +path+ argument also accepts a tuple (array of two elements)
  # in case the path is a variable that is going to required later,
  # in another file. In that case, the second argument to the tuple
  # is the __FILE__ where the variable was defined.
  def require(path) # :doc:
    if path.kind_of? Array
      dir = File.dirname(path[1])
      path = File.expand_path File.join(dir, path[0])
    elsif /^\.\.?\// =~ path
      dir = File.dirname caller[0].sub(/:\d+:in.*/, '')
      path = File.expand_path File.join(dir, path)
    end
    rel_original_require path
  end
end
