class ControlButton < ControlInterface

  def initialize(key, x, y, z, bitmap_or_path)
    super(key, x, y, z)
    if bitmap_or_path.is_a?(Bitmap)
      @width = bitmap_or_path.width
      @height = bitmap_or_path.height
      @sprite.bitmap = bitmap_or_path
    elsif bitmap_or_path.is_a?(String)
      b = Bitmap.new(bitmap_or_path)
      @width = b.width
      @height = b.height
      @sprite.bitmap = b
    end
  end
  
end