local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end
trouble.setup({
	mode = "workspace_diagnostics",
	fold_open = "",
	fold_closed = "",
	auto_jump = { "lsp_definitions" },
	auto_fold = true,
	use_diagnostic_signs = true,
})
local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	return
end
todo.setup({
	signs = true,
})
