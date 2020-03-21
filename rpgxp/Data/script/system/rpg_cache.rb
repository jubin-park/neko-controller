#===============================================================================
if !$NEKO_RUBY.nil?
#-------------------------------------------------------------------------------
module RPG::Cache
  def self.neko_control(filename)
    raise "컨트롤 그래픽 경로를 설정하지 않았습니다." if filename == ""
    begin
      self.load_bitmap("Graphics/Nekocontrols/", filename)
    rescue Exception => e
      raise "컨트롤 그래픽이 존재하지 않습니다.\n\n#{e.message}"
    end
  end
end
#-------------------------------------------------------------------------------
end
#===============================================================================