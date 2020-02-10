#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
class Sprite
  def set_cg(bmp=nil)
    if bmp.nil?
      return if self.bitmap.nil?
      return if !self.bitmap.is_a?(Bitmap)
      return if self.bitmap.disposed?
      self.ox = self.bitmap.width / 2.0
      self.oy = self.bitmap.height / 2.0
    elsif bmp.is_a?(Bitmap)
      return if bmp.disposed?
      self.ox = bmp.width / 2.0
      self.oy = bmp.height / 2.0
    else
      return
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================