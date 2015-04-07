_ = {}

_.isFunction = (fun) ->
  fun and fun != null and fun.constructor == "function"

_.any = (array, fun) ->
  if not _.isFunction fun
    fun = val -> val
  for element in array
    if fun element
      return true
  return false

_.all = (array, fun) ->
  if not _.isFunction fun
    fun = val -> val
  for element in array
    if not (fun element)
      return false
  return true

# check for equality of all the key values
_.equals = (obj1, obj2) ->
  # check that b has the same attributes as a and each has same value
  eqHelper = (a, b) ->
    for key of a
      if not key in b
        return false
      if a[key] != b[key]
        return false
    return true
    
  return eqHelper(obj1, obj2) and eqHelper(obj2, obj1)

_.last = (array) ->
  len = array.length
  if len == 0
    return null
  else
    return array[len-1]

if module?
  module.exports = _