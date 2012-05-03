ton = require 'ton'
bson = require 'bson'

global.ObjectID = bson.ObjectID
global.DBRef = bson.DBRef
global.Binary = bson.Binary
global.Timestamp = bson.Timestamp
global.MinKey = bson.MinKey
global.MaxKey = bson.MaxKey
global.Code = bson.Code
global.Long = bson.Long
global.Double = bson.Double

ton.add "ObjectID", (val) -> "new ObjectID(\"#{val}\")" if val instanceof ObjectID
ton.add "DBRef", (val) -> "new DBRef(\"#{val.namespace}\", new ObjectID(\"#{val.oid}\"), \"#{val.db}\")" if val instanceof DBRef
ton.add "Binary", (val) -> "new Binary(new Buffer(\"#{val}\"), \"#{val.sub_type}\")" if val instanceof Binary
ton.add "Code", (val) -> "new Code(\"#{val.code}\", #{ton.stringify(val.scope)})" if val instanceof Code
ton.add "Long", (val) -> "new Long(#{val.low_}, #{val.high_})" if val instanceof Long
ton.add "Double", (val) -> "new Double(#{val.value})" if val instanceof Double
ton.add "MinKey", (val) -> "new MinKey()" if val instanceof MinKey
ton.add "MaxKey", (val) -> "new MaxKey()" if val instanceof MaxKey
module.exports = {}