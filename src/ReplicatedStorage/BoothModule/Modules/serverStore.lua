local Store = require(script.Parent.Store)

-- This store is used both on client and server. The server version is a subset of the client one, containing only
-- The server store is automatically synchronized with the client stores.
local serverStore = Store.new()

return serverStore