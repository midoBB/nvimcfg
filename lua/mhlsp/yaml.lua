local status_schema, store = pcall(require, "schemastore")
if not status_schema then
	return
end
return {
	schemastore = {
		enable = true,
	},
	settings = {
		yaml = {
			hover = true,
			completion = true,
			validate = { enable = true },
			schemas = store.json.schemas(),
		},
	},
}
