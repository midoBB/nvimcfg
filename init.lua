require("mh.options")
require(
  "lazy"
).setup(
  "plugins",
  { lockfile = "~/.dotfiles/modules/nvim/config/lazy-lock.json" }
)
require("mh.autocmds")
-- TODO: finish migration
