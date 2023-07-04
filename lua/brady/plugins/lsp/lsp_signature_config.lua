return {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  floating_window = true,
  zindex = 1002,
  hint_inline = function()
    return true
  end,
  always_trigger = false,
  hint_enable = false,
  extra_trigger_chars = { '(' },
  transparency = nil,
  handler_opts = {
    border = 'none', -- double, rounded, single, shadow, none, or a table of borders
  },
  toggle_key = '<C-k>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  toggle_key_flip_floatwin_setting = true, -- true: toggle float setting after toggle key pressed
}
