##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 # Brendan Coles <bcoles@gmail.com>
# Updated string regexp
##
# Version 0.2
# remove :certainty
##
Plugin.define "MetaPoweredBy" do
author "Andrew Horton"
version "0.3"
description "This plugin extracts the values for meta tags named poweredby, powered-by, and powered by"

# Examples #
examples %w|
blog.chris.de
idempot.net/blog/
www.thunderboltmountain.com/serendipity/
www.camerongray.net
www.harvestdream.org
|

trigger "powered"

# Matches #
matches [

# Matches poweredby, powered-by, and powered by
{ :string=>/<meta[^>]+name=["']powered[\- ]?by["'][^>]+content=["']([^"]+)["']/i },

]

end

