local Store = require(script.Parent.Store)

-- This store is to be used only on the client. It contains both UI states and data from the server, the latter being
-- synchronized with the server store
local store = Store.new()

return store
