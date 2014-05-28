##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "StackExchange" do
author "Mateusz Golewski"
version "0.1"
description "StackExchange family Q&A forums."
examples %w|http://stackoverflow.com/|

matches [

{:name=>"StackExchange.init() call",
:regexp=>/StackExchange.init/},

]

end
