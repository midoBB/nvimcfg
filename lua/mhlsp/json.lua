local status_schema, store = pcall(require, "schemastore")
if not status_schema then
	return
end
return {
	settings = {
		json = {
			schemas = store.json.schemas(),
			validate = { enable = true },
		},
	},
}
