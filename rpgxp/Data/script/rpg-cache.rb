module RPG::Cache
  def self.neko_control(filename)
    self.load_bitmap("Graphics/Nekocontrols/", filename)
  end
end