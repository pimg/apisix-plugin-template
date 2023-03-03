local core = require("apisix.core")



local plugin_name = "hello-world"

local schema = {
    type = "object",
    properties = {
        name = {
            type = "string"
        },
    },
    required = {"name"}
}

local metadata_schema = {}

local _M = {
    version = 0.1,
    priority = 1,
    name = plugin_name,
    schema = schema,
    metadata_schema = metadata_schema
}

function _M.check_schema(conf, schema_type)
    if schema_type == core.schema.TYPE_METADATA then
        return core.schema.check(metadata_schema, conf)
    end
    return core.schema.check(schema, conf)
end

function _M.access(conf, ctx) 
    core.log.warn("hello " .. conf.name)
end

return _M