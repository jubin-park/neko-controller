#===============================================================================
if $NEKO_RUBY == 187 and RGSS.is_mobile?
#-------------------------------------------------------------------------------
module Input
  Entities[SDL::Key::S] = Y
  Entities[SDL::Key::LCTRL] = CTRL
end
#-------------------------------------------------------------------------------
end
#===============================================================================