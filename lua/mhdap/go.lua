local status, dap = pcall(require, "dap-go")
if status then
	dap.setup()
end
