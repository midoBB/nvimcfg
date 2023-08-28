local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
	return
end
neogit.setup({
	disable_commit_confirmation = true,
	disable_signs = true,
	auto_refresh = false,
	disable_builtin_notifications = true,
	integrations = {
		diffview = true,
	},
})
