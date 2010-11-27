$:.reject! do |x|
  x == '.'
end

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
  def require(path) # :doc:
    if /^\.\.?\// =~ path
      dir = File.dirname caller[0].sub(/:\d+:in.*/, '')
      path = File.expand_path File.join(dir, path)
    end
    rel_original_require path
  end
end
